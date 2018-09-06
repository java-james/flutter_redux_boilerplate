import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/models/app_state.dart';
import 'package:redux_thunk_boilerplate/src/ui/screens/about.dart';
import 'package:redux/redux.dart';

final Function onViewAbout = (BuildContext context) {
  return (Store<AppState> store) {
    // Could do a bunch of calls etc here
    Navigator.of(context).pushNamed(AboutScreen.route);
  };
};
