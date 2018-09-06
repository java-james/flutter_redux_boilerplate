import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/auth.dart' as actions;
import 'package:redux_thunk_boilerplate/src/models/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, actions.UserLoginRequest>(userLoginRequestReducer),
  TypedReducer<AuthState, actions.UserLoginSuccess>(userLoginSuccessReducer),
  TypedReducer<AuthState, actions.UserLoginFailure>(userLoginFailureReducer),
  TypedReducer<AuthState, actions.UserLogout>(userLogoutReducer),
]);

AuthState userLoginRequestReducer(AuthState authState, actions.UserLoginRequest action) {
  return AuthState().copyWith(isAuthenticated: false, error: null);
}

AuthState userLoginSuccessReducer(AuthState authState, actions.UserLoginSuccess action) {
  return AuthState().copyWith(isAuthenticated: true, user: action.user, error: null);
}

AuthState userLoginFailureReducer(AuthState authState, actions.UserLoginFailure action) {
  return AuthState().copyWith(isAuthenticated: false, error: action.error);
}

AuthState userLogoutReducer(AuthState authState, actions.UserLogout action) {
  return AuthState();
}
