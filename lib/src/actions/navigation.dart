import 'package:pedantic/pedantic.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_thunk_boilerplate/src/constants/keys.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';

class NavigateReplace {
  final String routeName;

  NavigateReplace(this.routeName);
}

class NavigateReplaceAll {
  final String routeName;

  NavigateReplaceAll(this.routeName);
}

class NavigatePush {
  final String routeName;

  NavigatePush(this.routeName);
}

class NavigatePop {}

ThunkAction<AppState> doNavigateReplaceAll(String routeName) => (store) async {
      unawaited(navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (_) => false));
      store.dispatch(NavigateReplace(routeName));
    };

ThunkAction<AppState> doNavigateReplace(String routeName) => (store) async {
      final routes = store.state.navigation.routes;
      if (routes.isEmpty || routes.last != routeName) {
        unawaited(navigatorKey.currentState.pushReplacementNamed(routeName));
      }
      store.dispatch(NavigateReplaceAll(routeName));
    };

ThunkAction<AppState> doNavigatePush(String routeName) => (store) async {
      final routes = store.state.navigation.routes;
      if (routes.isEmpty || routes.last != routeName) {
        unawaited(navigatorKey.currentState.pushNamed(routeName));
      }
      store.dispatch(NavigatePush(routeName));
    };
