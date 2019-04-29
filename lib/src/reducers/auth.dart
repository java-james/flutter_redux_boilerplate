import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/auth.dart' as auth_actions;
import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/models/state/auth.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, auth_actions.LoginSuccess>(_loginSuccessReducer),
  TypedReducer<AuthState, global_actions.Reset>(_resetReducer),
]);

AuthState _loginSuccessReducer(AuthState authState, auth_actions.LoginSuccess action) {
  return AuthState().copyWith(token: action.token, user: action.user);
}

AuthState _resetReducer(AuthState authState, global_actions.Reset action) => AuthState();
