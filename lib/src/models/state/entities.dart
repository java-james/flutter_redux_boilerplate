import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cards.dart';

part 'entities.g.dart';

@immutable
@JsonSerializable()
class EntitiesState {
  final CardsState cards;

  EntitiesState({
    CardsState cards,
  }) : cards = cards ?? CardsState();

  factory EntitiesState.fromJson(Map<String, dynamic> json) => _$EntitiesStateFromJson(json);

  Map<String, dynamic> toJson() => _$EntitiesStateToJson(this);

  EntitiesState copyWith({CardsState cards}) => EntitiesState(
        cards: cards ?? this.cards,
      );

  @override
  String toString() {
    return '{cards: $cards}';
  }
}
