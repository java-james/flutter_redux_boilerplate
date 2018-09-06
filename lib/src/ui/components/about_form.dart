import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class AboutForm extends StatelessWidget {
  final String token;

  AboutForm({@required this.token});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Center(child: Text('Token: $token. TODO add menu :)'))],
    );
  }
}
