import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:redux_thunk_boilerplate/src/models/app_state.dart';


@immutable
class AppWrapper extends StatelessWidget {
  final Widget child;

  AppWrapper({this.child});

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, int>(
    converter: (store) => store.state.global.loading,
    builder: (context, loading) => ModalProgressHUD(child: child, inAsyncCall: loading > 0),
  );
}
