import 'package:redux_persist/redux_persist.dart';

import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/reducers/auth.dart';
import 'package:redux_thunk_boilerplate/src/reducers/global.dart';

AppState appReducer(AppState state, action) {
  if (action is PersistLoadedAction<AppState>) {
    return action.state ?? state;
  } else {
    return AppState(
      global: globalReducer(state.global, action),
      auth: authReducer(state.auth, action),
    );
  }
}
