import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/styles/texts.dart';
import 'package:meta/meta.dart';

import 'package:redux_thunk_boilerplate/src/styles/colours.dart';

@immutable
class LoginForm extends StatelessWidget {
  final Function(BuildContext) dispatchOnLogin;

  LoginForm({@required this.dispatchOnLogin});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        logo,
        SizedBox(height: 20.0),
        title,
        SizedBox(height: 20.0),
        email,
        SizedBox(height: 8.0),
        password,
        SizedBox(height: 24.0),
        loginButton(context),
        forgotLabel
      ],
    );
  }

  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('lib/src/assets/images/logo.png'),
    ),
  );

  final title = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Redux Thunk',
        style: textStyles['title'],
      ),
    ],
  );

  final email = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'james-collins@hotmail.co.nz',
    decoration: InputDecoration(
      hintText: 'Email',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
  );

  final password = TextFormField(
    autofocus: false,
    initialValue: 'password',
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
  );

  Widget loginButton(BuildContext context) => MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: () => dispatchOnLogin(context),
        color: colourStyles['primary'],
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      );

  final forgotLabel = FlatButton(
    child: Text(
      'Forgot password?',
      style: TextStyle(color: Colors.black54),
    ),
    onPressed: () {},
  );
}
