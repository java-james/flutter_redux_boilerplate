import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/reducers/app.dart';
import 'package:redux_thunk_boilerplate/src/store/middleware.dart';
import 'package:redux/redux.dart';

Store<AppState> store = _createStore();

Store<AppState> _createStore() {
  Store<AppState> store = Store(
    appReducer,
    initialState: AppState(),
    middleware: createMiddleware(),
  );

  persistor.load(store);
  return store;
}
