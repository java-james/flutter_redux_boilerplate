import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';

final Persistor<AppState> persistor = Persistor<AppState>(
    storage: FlutterStorage(), serializer: JsonSerializer<AppState>((json) => AppState.fromJson(json)));

// Set up middleware
List<Middleware<AppState>> createMiddleware() => <Middleware<AppState>>[
      thunkMiddleware,
      persistor.createMiddleware(),
      LoggingMiddleware.printer(),
    ];
