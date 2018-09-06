import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';

final persistor = Persistor<AppState>(
    storage: FlutterStorage(AppState.STATE_KEY), decoder: AppState.rehydrationJSON, debug: true);

// Set up middleware
List<Middleware<AppState>> createMiddleware() => <Middleware<AppState>>[
      thunkMiddleware,
      persistor.createMiddleware(),
      LoggingMiddleware.printer(),
    ];
