import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:redux_thunk_boilerplate/src/ui/containers/dashboard.dart';
import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/actions/dashboard.dart' as dashboard_actions;

@immutable
class DashboardScreen extends StatelessWidget {
  static final String route = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardVM>(
      converter: buildVM,
      builder: (BuildContext context, DashboardVM vm) {
        return DashboardContainer(vm: vm);
      },
    );
  }

  DashboardVM buildVM(Store<AppState> store) {
    return DashboardVM(
        user: store.state.auth.user,
        dispatchOnViewAbout: (BuildContext context) {
          store.dispatch(dashboard_actions.onViewAbout(context));
        });
  }
}
