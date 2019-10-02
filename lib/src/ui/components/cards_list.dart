import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/models/review-card.dart';

@immutable
class CardsList extends StatelessWidget {
  final List<ReviewCard> cards;
  final Function(BuildContext, String cardId) onViewCard;

  CardsList({@required this.cards, @required this.onViewCard});

  @override
  Widget build(BuildContext context) => cards.isNotEmpty ? _renderList() : _renderEmpty();

  Widget _renderList() => Text('TODO: Your cards list will be shown here :)');

  Widget _renderEmpty() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.info_outline),
          SizedBox(width: 5),
          Text('No Cards'),
        ],
      );
}
