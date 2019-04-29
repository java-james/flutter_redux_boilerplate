import 'package:flutter/material.dart';

import 'package:redux_thunk_boilerplate/src/models/state/auth.dart';
import 'package:redux_thunk_boilerplate/src/ui/components/login_form.dart';

@immutable
class LoginContainer extends StatelessWidget {
  final LoginVM vm;

  LoginContainer({@required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(
          dispatchOnLogin: vm.dispatchOnLogin,
        ),
      ),
    );
  }
}

@immutable
class LoginVM {
  final AuthState authState;
  final Function(BuildContext) dispatchOnLogin;

  LoginVM({
    @required this.authState,
    @required this.dispatchOnLogin,
  });
}
