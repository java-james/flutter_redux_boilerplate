import 'package:flutter/material.dart';

import 'package:redux_thunk_boilerplate/src/models/user.dart';
import 'package:redux_thunk_boilerplate/src/styles/texts.dart';
import 'package:redux_thunk_boilerplate/src/ui/components/dashboard_list.dart';

@immutable
class DashboardContainer extends StatelessWidget {
  final DashboardVM vm;

  DashboardContainer({@required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redux Thunk', style: textStyles['nav_title'])),
      floatingActionButton: FloatingActionButton(
          onPressed: () => vm.dispatchOnViewAbout(context),
          child: Icon(
            Icons.info_outline,
          )),
      body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: DashboardList(
            onClickAbout: vm.dispatchOnViewAbout,
          )),
    );
  }
}

@immutable
class DashboardVM {
  final User user;
  final Function(BuildContext) dispatchOnViewAbout;

  DashboardVM({@required this.user, @required this.dispatchOnViewAbout});
}
