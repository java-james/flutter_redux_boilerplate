import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/ui/containers/about.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';

@immutable
class AboutScreen extends StatelessWidget {
  static final String route = '/about';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AboutVM>(
      converter: buildVM,
      builder: (BuildContext context, AboutVM vm) {
        return AboutContainer(vm: vm);
      },
    );
  }

  AboutVM buildVM(Store<AppState> store) {
    return AboutVM(
      user: store.state.auth.user,
    );
  }
}
