import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/actions/global.dart';
import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/models/user.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/login.dart';

class LoginSuccess {
  final String token;
  final User user;

  LoginSuccess(this.token, this.user);
}

class LogoutSuccess {}

final Function onLogin = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(IncrementLoadingRequest());
    // TODO: login request
    store.dispatch(LoginSuccess('some_token', User(id: 'some_id', email: 'test@testmail.com', name: 'Test')));
    store.dispatch(DecrementLoadingRequest());
    Navigator.of(context).pushNamedAndRemoveUntil(DashboardScreen.route, (_) => false);
  };
};

final Function onLogout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(IncrementLoadingRequest());
    // TODO: logout request
    store.dispatch(LogoutSuccess());
    store.dispatch(DecrementLoadingRequest());
    Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.route, (_) => false);
  };
};
