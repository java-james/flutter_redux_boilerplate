import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/reducers/app.dart';
import 'package:redux_thunk_boilerplate/src/store/middleware.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  Store<AppState> store = Store(
    appReducer,
    initialState: AppState(),
    middleware: createMiddleware(),
  );

  persistor.load(store);
  return store;
}
