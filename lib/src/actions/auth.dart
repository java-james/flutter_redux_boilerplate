import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/actions/global.dart';
import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/models/user.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/login.dart';

class UserLoginRequest {}

class UserLoginSuccess {
  final User user;

  UserLoginSuccess(this.user);
}

class UserLoginFailure {
  final String error;

  UserLoginFailure(this.error);
}

class UserLogout {}

final Function onLogin = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(IncrementLoadingRequest());
    store.dispatch(UserLoginRequest());
    // TODO: login request
    store.dispatch(UserLoginSuccess(User(token: 'placeholder_token', id: 'placeholder_id')));
    store.dispatch(DecrementLoadingRequest());
    Navigator.of(context).pushNamedAndRemoveUntil(DashboardScreen.route, (_) => false);
  };
};

final Function onLogout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(IncrementLoadingRequest());
    store.dispatch(UserLogout());
    store.dispatch(DecrementLoadingRequest());
    Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.route, (_) => false);
  };
};
