import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'package:redux_thunk_boilerplate/src/models/user.dart';

// part generated by build runner. (see readme)
part 'auth.g.dart';

@immutable
@JsonSerializable()
class AuthState {

  final String token;

  final User user;

  final String error;

  AuthState({
    this.token,
    this.user,
    this.error,
  });

  // allows us to modify AuthState parameters while cloning previous ones
  AuthState copyWith({String token, String error, User user}) {
    return AuthState(
      token: token ?? this.token,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStateToJson(this);

  @override
  String toString() {
    return '{token: $token, user: $user, error: $error}';
  }
}
