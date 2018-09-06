import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/global.dart' as actions;
import 'package:redux_thunk_boilerplate/src/models/global_state.dart';

Reducer<GlobalState> globalReducer = combineReducers([
  TypedReducer<GlobalState, actions.IncrementLoadingRequest>(incrementLoadingReducer),
  TypedReducer<GlobalState, actions.DecrementLoadingRequest>(decrementLoadingReducer),
]);

GlobalState incrementLoadingReducer(GlobalState state, actions.IncrementLoadingRequest action) {
  final loading = state.loading + action.amount;
  return GlobalState().copyWith(loading: loading < 0 ? 0 : loading);
}

GlobalState decrementLoadingReducer(GlobalState state, actions.DecrementLoadingRequest action) {
  final loading = state.loading - action.amount;
  return GlobalState().copyWith(loading: loading < 0 ? 0 : loading);
}
