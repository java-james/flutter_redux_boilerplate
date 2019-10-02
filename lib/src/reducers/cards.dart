import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/models/state/cards.dart';

Reducer<CardsState> cardsReducer = combineReducers([
  TypedReducer<CardsState, global_actions.ResetAction>(_resetReducer),
]);

CardsState _resetReducer(CardsState cardsState, global_actions.ResetAction action) => CardsState();
