import 'package:meta/meta.dart';

@immutable
class User {
  final String id;
  final String token;

  User({@required this.token, @required this.id});

  Map<String, dynamic> toJson() => <String, dynamic>{'token': token, 'id': id};

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json['token'],
        id: json['id'],
      );

  @override
  String toString() {
    return '{id: $id, token: $token,}';
  }
}
