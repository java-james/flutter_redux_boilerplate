import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/auth.dart' as actions;
import 'package:redux_thunk_boilerplate/src/models/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, actions.LoginSuccess>(loginSuccessReducer),
  TypedReducer<AuthState, actions.LogoutSuccess>(logoutReducer),
]);

AuthState loginSuccessReducer(AuthState authState, actions.LoginSuccess action) {
  return AuthState().copyWith(token: action.token, user: action.user);
}

AuthState logoutReducer(AuthState authState, actions.LogoutSuccess action) {
  return AuthState();
}
