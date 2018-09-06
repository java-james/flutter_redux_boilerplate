import 'package:flutter/material.dart';

import 'package:redux_thunk_boilerplate/src/styles/colours.dart';

@immutable
class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: colourStyles['gray'],
            strokeWidth: 2.0,
          ),
        ),
      ),
    );
  }
}
