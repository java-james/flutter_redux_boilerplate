import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:redux_thunk_boilerplate/src/ui/components/dashboard_tile.dart';

@immutable
class DashboardList extends StatelessWidget {
  final Function(BuildContext) onClickAbout;
  final Function(BuildContext) onClickLogout;
  final Function(BuildContext) onClickCards;

  DashboardList({
    @required this.onClickAbout,
    @required this.onClickLogout,
    @required this.onClickCards,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      children: _generateTiles(),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
    );
  }

  final List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 4),
    const StaggeredTile.count(2, 3),
    const StaggeredTile.count(2, 3),
    const StaggeredTile.count(2, 2),
  ];

  // A cheap mans tile generation
  List<Widget> _generateTiles() => <Widget>[
        DashboardTile(
          title: 'About',
          action: onClickAbout,
          backgroundColor: Colors.green,
          iconData: Icons.info_outline,
        ),
        DashboardTile(
          title: 'View Cards',
          action: onClickCards,
          backgroundColor: Colors.lightBlue,
          iconData: Icons.crop_landscape,
        ),
        DashboardTile(
          title: 'Log Out',
          backgroundColor: Colors.amber,
          iconData: Icons.exit_to_app,
          action: onClickLogout,
        ),
        DashboardTile(title: 'No Action 3', backgroundColor: Colors.deepOrange, iconData: Icons.image),
      ];
}
