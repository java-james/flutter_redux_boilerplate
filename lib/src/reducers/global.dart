import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/models/state/global.dart';

Reducer<GlobalState> globalReducer = combineReducers([
  TypedReducer<GlobalState, global_actions.IncrementLoadingAction>(_incrementLoadingReducer),
  TypedReducer<GlobalState, global_actions.DecrementLoadingAction>(_decrementLoadingReducer),
]);

GlobalState _incrementLoadingReducer(GlobalState state, global_actions.IncrementLoadingAction action) {
  final loading = state.loading + action.amount;
  return GlobalState().copyWith(loading: loading < 0 ? 0 : loading);
}

GlobalState _decrementLoadingReducer(GlobalState state, global_actions.DecrementLoadingAction action) {
  final loading = state.loading - action.amount;
  return GlobalState().copyWith(loading: loading < 0 ? 0 : loading);
}
