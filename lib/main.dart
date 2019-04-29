import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/store/middleware.dart';
import 'package:redux_thunk_boilerplate/src/store/store.dart';
import 'package:redux_thunk_boilerplate/src/styles/theme.dart' as theme;
import 'package:redux_thunk_boilerplate/src/ui/screens/about.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/app.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/loading.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/login.dart';

_init() async {
  // Perform any async or other startup actions here
  // The splash screen is shown during this time
}

void main() {
  _init().then((r) => runApp(App(store: store)));
}

@immutable
class App extends StatelessWidget {
  final store;

  App({this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PersistorGate(
      persistor: persistor,
      loading: RehydrationScreen(),
      builder: (context) =>
          StoreProvider<AppState>(
              store: store,
              child: MaterialApp(
                  title: 'Flutter redux thunk',
                  builder: (context, child) => AppScreen(child: child),
                  theme: theme.rootTheme,
                  home: LoginScreen(),
                  routes: <String, WidgetBuilder>{
                    LoginScreen.route: (BuildContext context) => LoginScreen(),
                    DashboardScreen.route: (BuildContext context) => DashboardScreen(),
                    AboutScreen.route: (BuildContext context) => AboutScreen(),
                  })),
    );
  }
}
