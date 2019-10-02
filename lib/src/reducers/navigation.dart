import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/actions/global.dart' as global_actions;
import 'package:redux_thunk_boilerplate/src/actions/navigation.dart' as navigation_actions;
import 'package:redux_thunk_boilerplate/src/models/state/navigation.dart';

Reducer<NavigationState> navigationReducer = combineReducers([
  TypedReducer<NavigationState, navigation_actions.NavigateReplace>(_navigateReplaceReducer),
  TypedReducer<NavigationState, navigation_actions.NavigatePush>(_navigatePushReducer),
  TypedReducer<NavigationState, navigation_actions.NavigatePop>(_navigatePopReducer),
  TypedReducer<NavigationState, navigation_actions.NavigateReplaceAll>(_navigateReplaceAllReducer),
  TypedReducer<NavigationState, global_actions.ResetAction>(_resetReducer),
]);

NavigationState _navigateReplaceReducer(NavigationState navigationState, navigation_actions.NavigateReplace action) {
  final routes = List<String>.from(navigationState.routes);
  if (routes.isNotEmpty) {
    routes.removeLast();
  }
  routes.add(action.routeName);
  return NavigationState().copyWith(routes: routes);
}

NavigationState _navigatePushReducer(NavigationState navigationState, navigation_actions.NavigatePush action) {
  final routes = List<String>.from(navigationState.routes)..add(action.routeName);
  return NavigationState().copyWith(routes: routes);
}

NavigationState _navigatePopReducer(NavigationState navigationState, navigation_actions.NavigatePop action) {
  final routes = List<String>.from(navigationState.routes);
  if (routes.isNotEmpty) {
    routes.removeLast();
  }
  return NavigationState().copyWith(routes: routes);
}

NavigationState _navigateReplaceAllReducer(
    NavigationState navigationState, navigation_actions.NavigateReplaceAll action) {
  final routes = <String>[]..add(action.routeName);
  return NavigationState().copyWith(routes: routes);
}

NavigationState _resetReducer(NavigationState navigationState, global_actions.ResetAction action) => NavigationState();
