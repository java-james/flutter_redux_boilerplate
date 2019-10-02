import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'review-card-side.g.dart';

@immutable
@JsonSerializable()
class ReviewCardSide {
  final String text;

  ReviewCardSide({@required this.text});

  factory ReviewCardSide.fromJson(Map<String, dynamic> json) => _$ReviewCardSideFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewCardSideToJson(this);

  @override
  String toString() => '{text: $text}';
}
