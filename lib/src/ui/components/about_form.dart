import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class AboutForm extends StatelessWidget {
  final String name;

  AboutForm({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Center(child: Text('Name of logged in user: $name'))],
    );
  }
}
