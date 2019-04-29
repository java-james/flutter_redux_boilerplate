import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/models/state/global.dart';

Reducer<GlobalState> globalReducer = combineReducers([
  TypedReducer<GlobalState, global_actions.IncrementLoadingRequest>(_incrementLoadingReducer),
  TypedReducer<GlobalState, global_actions.DecrementLoadingRequest>(_decrementLoadingReducer),
]);

GlobalState _incrementLoadingReducer(GlobalState state, global_actions.IncrementLoadingRequest action) {
  final loading = state.loading + action.amount;
  return GlobalState().copyWith(loading: loading < 0 ? 0 : loading);
}

GlobalState _decrementLoadingReducer(GlobalState state, global_actions.DecrementLoadingRequest action) {
  final loading = state.loading - action.amount;
  return GlobalState().copyWith(loading: loading < 0 ? 0 : loading);
}
