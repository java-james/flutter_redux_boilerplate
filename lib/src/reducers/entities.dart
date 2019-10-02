import 'package:redux_thunk_boilerplate/src/models/state/entities.dart';

import 'cards.dart';

EntitiesState entitiesReducer(EntitiesState entitiesState, action) => EntitiesState(
      cards: cardsReducer(entitiesState.cards, action),
    );
