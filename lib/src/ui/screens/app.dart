import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk_boilerplate/src/models/state/app.dart';
import 'package:redux_thunk_boilerplate/src/ui/containers/app.dart';

@immutable
class AppScreen extends StatelessWidget {
  final Widget child;

  AppScreen({this.child});

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, AppWrapperVM>(converter: _buildVM, builder: (context, vm) => AppContainer(vm: vm));

  AppWrapperVM _buildVM(Store<AppState> store) => AppWrapperVM(loading: store.state.global.loading, child: child);
}
