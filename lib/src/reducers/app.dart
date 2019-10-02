import 'package:redux_thunk_boilerplate/src/models/state/app.dart';

import 'auth.dart';
import 'entities.dart';
import 'global.dart';
import 'navigation.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    global: globalReducer(state.global, action),
    auth: authReducer(state.auth, action),
    entities: entitiesReducer(state.entities, action),
    navigation: navigationReducer(state.navigation, action),
  );
}
