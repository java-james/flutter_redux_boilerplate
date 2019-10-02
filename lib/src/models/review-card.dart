import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'review-card-side.dart';

part 'review-card.g.dart';

@immutable
@JsonSerializable()
class ReviewCard {
  final String id;

  final ReviewCardSide front;

  final ReviewCardSide back;

  ReviewCard({@required this.id, @required this.front, @required this.back});

  factory ReviewCard.fromJson(Map<String, dynamic> json) => _$ReviewCardFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewCardToJson(this);

  @override
  String toString() => '{id: $id, front: $front, back: $back}';
}
