import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/actions/auth.dart' as auth_actions;
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/ui/containers/login.dart';

@immutable
class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginVM>(
      converter: buildVM,
      builder: (BuildContext context, LoginVM vm) {
        return LoginContainer(vm: vm);
      },
    );
  }

  LoginVM buildVM(Store<AppState> store) {
    return LoginVM(
        authState: store.state.auth,
        dispatchOnLogin: (BuildContext context) {
          store.dispatch(auth_actions.doLogin(context));
        });
  }
}
