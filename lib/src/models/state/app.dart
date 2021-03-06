import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:redux_thunk_boilerplate/src/models/state/navigation.dart';

import 'auth.dart';
import 'entities.dart';
import 'global.dart';

part 'app.g.dart';
// part generated by build runner. (see readme)

@immutable
@JsonSerializable()
class AppState {
  final AuthState auth;

  final GlobalState global;

  final EntitiesState entities;

  final NavigationState navigation;

  AppState({GlobalState global, AuthState auth, EntitiesState entities, NavigationState navigation})
      : global = global ?? GlobalState(),
        auth = auth ?? AuthState(),
        navigation = navigation ?? NavigationState(),
        entities = entities ?? EntitiesState();

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  // modifies the AppState parameters while cloning previous ones
  AppState copyWith({
    AuthState auth,
    GlobalState global,
    EntitiesState entities,
    NavigationState navigation,
  }) =>
      AppState(
        auth: auth ?? this.auth,
        global: global ?? this.global,
        entities: entities ?? this.entities,
        navigation: navigation ?? this.navigation,
      );

  @override
  String toString() => 'AppState{auth: $auth, global: $global, entities: $entities, navigation: $navigation}';
}
