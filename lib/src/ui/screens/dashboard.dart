import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/actions/auth.dart' as auth_actions;
import 'package:redux_thunk_boilerplate/src/actions/navigation.dart' as navigation_actions;
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/ui/containers/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/about.dart';

@immutable
class DashboardScreen extends StatelessWidget {
  static const String route = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardVM>(
      converter: buildVM,
      builder: (BuildContext context, DashboardVM vm) {
        return DashboardContainer(vm: vm);
      },
    );
  }

  DashboardVM buildVM(Store<AppState> store) {
    return DashboardVM(
        user: store.state.auth.user,
        dispatchOnViewAbout: (BuildContext context) {
          store.dispatch(navigation_actions.doNavigatePush(AboutScreen.route));
        },
        dispatchOnLogout: (BuildContext context) {
          store.dispatch(auth_actions.doLogout(context));
        });
  }
}
