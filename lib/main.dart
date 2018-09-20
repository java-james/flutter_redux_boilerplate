import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/store/middleware.dart';
import 'package:redux_thunk_boilerplate/src/store/store.dart';
import 'package:redux_thunk_boilerplate/src/styles/presentation/platform_adaptive.dart';
import 'package:redux_thunk_boilerplate/src/ui/app_wrapper.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/about.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/loading.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/login.dart';

void main() => runApp(App());

@immutable
class App extends StatelessWidget {
  final store = createStore();

  App();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PersistorGate(
      persistor: persistor,
      loading: LoadingScreen(),
      builder: (context) => StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
              title: 'Flutter redux thunk',
              builder: (context, child) => AppWrapper(child: child),
              theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
              home: LoginScreen(),
              routes: <String, WidgetBuilder>{
                LoginScreen.route: (BuildContext context) => LoginScreen(),
                DashboardScreen.route: (BuildContext context) => DashboardScreen(),
                AboutScreen.route: (BuildContext context) => AboutScreen(),
              })),
    );
  }
}
