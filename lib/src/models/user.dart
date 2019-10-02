import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User {
  final String id;

  final String email;

  final String name;

  User({@required this.id, @required this.email, @required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return '{id: $id, email: $email, name: $name}';
  }
}
