import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'navigation.g.dart';

@immutable
@JsonSerializable()
class NavigationState {
  // Ignore loading (Do not persist)
  @JsonKey(ignore: true)
  final List<String> routes;

  NavigationState({List<String> routes}) : routes = routes ?? <String>[];

  // allows us to modify NavigationState parameters while cloning previous ones
  NavigationState copyWith({List<String> routes}) => NavigationState(
        routes: routes ?? this.routes,
      );

  factory NavigationState.fromJson(Map<String, dynamic> json) => _$NavigationStateFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationStateToJson(this);

  @override
  String toString() {
    return '{routes: $routes}';
  }
}
