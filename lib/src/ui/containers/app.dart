import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:meta/meta.dart';

import 'package:redux_thunk_boilerplate/src/constants/keys.dart' as keys;

@immutable
class AppContainer extends StatelessWidget {
  final AppWrapperVM vm;

  AppContainer({this.vm});

  @override
  Widget build(BuildContext context) => Scaffold(
        key: keys.appScaffold,
        body: LoadingOverlay(
          child: vm.child,
          isLoading: vm.loading > 0,
          color: Theme.of(context).colorScheme.background,
        ),
      );
}

@immutable
class AppWrapperVM {
  final int loading;
  final Widget child;

  AppWrapperVM({@required this.loading, @required this.child});
}
