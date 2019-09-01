import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/reducers/app.dart';
import 'package:redux_thunk_boilerplate/src/store/middleware.dart';

Future<Store<AppState>> createStore() async {
  final _initialState = await _loadState();
  Store<AppState> store = Store(
    appReducer,
    initialState: _initialState,
    middleware: createMiddleware(),
  );
  return store;
}

Future<AppState> _loadState() async {
  try {
    final initialState = await persistor.load();
    return initialState;
  } on Exception {
    // Re-hydration error
    return AppState();
  }
}