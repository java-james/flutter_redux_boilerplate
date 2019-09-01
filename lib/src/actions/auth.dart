import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/models/user.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/login.dart';

class LoginSuccess {
  final String token;
  final User user;

  LoginSuccess(this.token, this.user);
}

class LogoutSuccess {}

final Function onLogin = (BuildContext context) async {
  return (Store<AppState> store) {
    store.dispatch(global_actions.IncrementLoadingRequest());
    // TODO: login request
    store.dispatch(LoginSuccess('some_token', User(id: 'some_id', email: 'test@testmail.com', name: 'Test')));
    Navigator.of(context).pushNamedAndRemoveUntil(DashboardScreen.route, (_) => false);
    store.dispatch(global_actions.DecrementLoadingRequest());
  };
};

final Function onLogout = (BuildContext context) async  {
  return (Store<AppState> store) {
    store.dispatch(global_actions.IncrementLoadingRequest());
    // TODO: logout request
    store.dispatch(global_actions.Reset());
    Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.route, (_) => false);
    store.dispatch(global_actions.DecrementLoadingRequest());
  };
};
