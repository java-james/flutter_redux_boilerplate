import 'package:flutter/material.dart';

import 'package:redux_thunk_boilerplate/src/styles/texts.dart';

@immutable
class DashboardTile extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final IconData iconData;
  final Function action;

  DashboardTile({@required this.backgroundColor, @required this.iconData, @required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () => action == null ? null : action(context),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title, style: textStyles['tile_title']),
                Icon(
                  iconData,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
