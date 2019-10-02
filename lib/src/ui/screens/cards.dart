import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/ui/containers/cards.dart';

@immutable
class CardsScreen extends StatelessWidget {
  static const String route = 'cards';

  CardsScreen();

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, CardsVM>(
        converter: (store) => _buildVM(store, context),
        builder: (context, vm) => CardsContainer(vm: vm),
      );

  CardsVM _buildVM(Store<AppState> store, context) {
    _viewCard(context, cardId) {
      // store.dispatch(card_actions.SetCardDetail(cardId: cardId));
      // Navigator.of(context).pushNamed(CardScreen.route);
      // store.dispatch(navigation_actions.doPush(ConnectionScreen.route, navKey: keys.authenticatedNavigator));
    }

    final allCardIIds = store.state.entities.cards.allIds;
    final allCards = allCardIIds.map((cardId) => store.state.entities.cards.byId[cardId]).toList();

    return CardsVM(
      cards: allCards,
      onViewCard: _viewCard,
    );
  }
}
