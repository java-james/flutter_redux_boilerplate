import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/constants/keys.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/store/store.dart';
import 'package:redux_thunk_boilerplate/src/styles/theme.dart' as theme;
import 'package:redux_thunk_boilerplate/src/ui/screens/about.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/app.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/cards.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/login.dart';

import 'src/navigation/fab-route.dart';
import 'src/navigation/main-route.dart';
import 'src/navigation/route-aware-widget.dart';

void main() async {
  final store = await createStore();
  runApp(App(store: store));
}

MaterialPageRoute _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.route:
      return MainRoute(LoginScreen(), settings: settings);
    case DashboardScreen.route:
      return FabRoute(DashboardScreen(), settings: settings);
    case AboutScreen.route:
      return FabRoute(AboutScreen(), settings: settings);
    case CardsScreen.route:
      return FabRoute(CardsScreen(), settings: settings);
    default:
      return MainRoute(LoginScreen(), settings: settings);
  }
}

@immutable
class App extends StatelessWidget {
  final Store<AppState> store;

  App({this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter redux thunk',
          builder: (context, child) => AppScreen(child: child),
          theme: theme.rootTheme,
          //initialRoute: store.state.auth.user == null ? LoginScreen.route : LoginScreen.route,
          navigatorKey: navigatorKey,
          navigatorObservers: [routeObserver],
          onGenerateRoute: _getRoute,
        ));
  }
}
