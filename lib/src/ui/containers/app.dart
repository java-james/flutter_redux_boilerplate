import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:redux_thunk_boilerplate/src/constants/keys.dart' as keys;

@immutable
class AppContainer extends StatelessWidget {
  final AppWrapperVM vm;

  AppContainer({this.vm});

  @override
  Widget build(BuildContext context) => Scaffold(
        key: keys.appScaffold,
        body: ModalProgressHUD(child: vm.child, inAsyncCall: vm.loading > 0),
      );
}

@immutable
class AppWrapperVM {
  final int loading;
  final Widget child;

  AppWrapperVM({@required this.loading, @required this.child});
}
