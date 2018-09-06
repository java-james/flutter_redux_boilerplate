import 'package:flutter/cupertino.dart';

import 'package:redux_thunk_boilerplate/src/models/auth_state.dart';
import 'package:redux_thunk_boilerplate/src/models/global_state.dart';

@immutable
class AppState {
  static const String STATE_KEY = 'redux_thunk_boilerplate_app';

  final AuthState auth;
  final GlobalState global;

  AppState({GlobalState global, AuthState auth})
      : this.auth = auth ?? AuthState(),
        this.global = global ?? GlobalState();

  static AppState rehydrationJSON(appStateJson) => AppState(
      auth: appStateJson[AuthState.STATE_KEY] == null
          ? AuthState()
          : AuthState.fromJson(appStateJson[AuthState.STATE_KEY]),
      global: appStateJson[GlobalState.STATE_KEY] == null
          ? GlobalState()
          : GlobalState.fromJson(appStateJson[GlobalState.STATE_KEY]));

  Map<String, dynamic> toJson() =>
      <String, dynamic>{AuthState.STATE_KEY: auth.toJson(), GlobalState.STATE_KEY: global.toJson()};

  AppState copyWith({
    bool rehydrated,
    GlobalState global,
    AuthState auth,
  }) {
    return AppState(auth: auth ?? this.auth, global: global ?? this.global);
  }

  @override
  String toString() {
    return 'AppState{auth: $auth, global: $global}';
  }
}
