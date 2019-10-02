import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:redux_thunk_boilerplate/src/models/review-card.dart';

part 'cards.g.dart';

@immutable
@JsonSerializable()
class CardsState {
  final Map<String, ReviewCard> byId;

  final List<String> allIds;

  final List<String> unReviewedIds;

  final String detailId;

  final String error;

  CardsState({
    this.byId = const <String, ReviewCard>{},
    this.allIds = const <String>[],
    this.unReviewedIds = const <String>[],
    this.detailId,
    this.error = '',
  });

  CardsState copyWith({
    Map<String, ReviewCard> byId,
    List<String> allIds,
    List<String> unReviewedIds,
    String detailId,
    String error,
  }) =>
      CardsState(
        byId: byId ?? this.byId,
        allIds: allIds ?? this.allIds,
        unReviewedIds: unReviewedIds ?? this.unReviewedIds,
        detailId: detailId ?? this.detailId,
        error: error ?? this.error,
      );

  factory CardsState.fromJson(Map<String, dynamic> json) => _$CardsStateFromJson(json);

  Map<String, dynamic> toJson() => _$CardsStateToJson(this);

  @override
  String toString() =>
      '{byId: $byId, allIds: $allIds, unReviewedIds: $unReviewedIds, detailId: $detailId, error: $error}';
}
