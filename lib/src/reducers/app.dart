import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/reducers/auth.dart';
import 'package:redux_thunk_boilerplate/src/reducers/global.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    global: globalReducer(state.global, action),
    auth: authReducer(state.auth, action),
  );
}
