import 'package:flutter/material.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/actions/navigation.dart' as navigation_actions;
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

ThunkAction<AppState> doLogin(BuildContext context) => (store) async {
      store.dispatch(global_actions.IncrementLoadingAction());
      // TODO: login request
      store.dispatch(LoginSuccess('some_token', User(id: 'some_id', email: 'test@testmail.com', name: 'Test')));
      store.dispatch(navigation_actions.doNavigateReplace(DashboardScreen.route));
      store.dispatch(global_actions.DecrementLoadingAction());
    };

ThunkAction<AppState> doLogout(BuildContext context) => (store) async {
      store.dispatch(global_actions.IncrementLoadingAction());
      // TODO: logout request
      store.dispatch(global_actions.ResetAction());
      store.dispatch(navigation_actions.doNavigateReplaceAll(LoginScreen.route));
      store.dispatch(global_actions.DecrementLoadingAction());
    };
