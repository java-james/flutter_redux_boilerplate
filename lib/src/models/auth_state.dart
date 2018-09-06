import 'package:meta/meta.dart';

import 'package:redux_thunk_boilerplate/src/models/user.dart';

@immutable
class AuthState {
  static const String STATE_KEY = 'auth';

  // properties
  final bool isAuthenticated;
  final User user;
  final String error;

  // constructor with default
  AuthState({
    this.isAuthenticated = false,
    this.user,
    this.error,
  });

  // allows to modify AuthState parameters while cloning previous ones
  AuthState copyWith({bool isAuthenticated, String error, User user}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
        isAuthenticated: json['isAuthenticated'],
        error: json['error'],
        user: json['user'] == null ? null : User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isAuthenticated': isAuthenticated,
        'user': user == null ? null : user.toJson(),
        'error': error,
      };

  @override
  String toString() {
    return '{isAuthenticated: $isAuthenticated, user: $user, error: $error}';
  }
}
