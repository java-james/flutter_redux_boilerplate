import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'package:redux_thunk_boilerplate/src/models/state/auth.dart';
import 'package:redux_thunk_boilerplate/src/models/state/global.dart';

part 'app.g.dart';
// part generated by build runner. (see readme)


@immutable
@JsonSerializable()
class AppState {

  final AuthState auth;

  final GlobalState global;

  AppState({GlobalState global, AuthState auth})
      : auth = auth ?? AuthState(),
        global = global ?? GlobalState();

  // allows us to modify AppState parameters while cloning previous ones
  AppState copyWith({
    bool rehydrated,
    GlobalState global,
    AuthState auth,
  }) {
    return AppState(auth: auth ?? this.auth, global: global ?? this.global);
  }

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  @override
  String toString() {
    return 'AppState{auth: $auth, global: $global}';
  }
}
