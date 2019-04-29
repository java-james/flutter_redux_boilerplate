import 'package:flutter/material.dart';

@immutable
class RehydrationContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Container(
    color: Theme.of(context).colorScheme.primary,
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    ),
  );
}
