import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/models/user.dart';
import 'package:redux_thunk_boilerplate/src/styles/presentation/platform_adaptive.dart';
import 'package:redux_thunk_boilerplate/src/styles/texts.dart';
import 'package:redux_thunk_boilerplate/src/ui/components/about_form.dart';

@immutable
class AboutContainer extends StatelessWidget {
  final AboutVM vm;

  AboutContainer({@required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAdaptiveAppBar(
          title: Text(
        'Redux Thunk Boilerplate',
        style: textStyles['nav_title'],
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AboutForm(token: vm.user.token),
      )
    );
  }

}

@immutable
class AboutVM {
  final User user;

  AboutVM({@required this.user});
}
