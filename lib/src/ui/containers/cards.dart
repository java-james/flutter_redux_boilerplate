import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/models/review-card.dart';
import 'package:redux_thunk_boilerplate/src/ui/components/cards_list.dart';

@immutable
class CardsContainer extends StatelessWidget {
  final CardsVM vm;

  CardsContainer({@required this.vm});

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Divider(height: 0, color: Colors.black12),
              Expanded(
                child: CardsList(
                  onViewCard: vm.onViewCard,
                  cards: vm.cards,
                ),
              ),
            ],
          ),
        ),
      );

}

@immutable
class CardsVM {
  final List<ReviewCard> cards;
  final Function(BuildContext context, String connectionId) onViewCard;

  CardsVM({
    @required this.cards,
    @required this.onViewCard,
  });
}
