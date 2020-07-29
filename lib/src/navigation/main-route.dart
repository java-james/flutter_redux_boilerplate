import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux_thunk_boilerplate/src/navigation/route-aware-widget.dart';

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
      builder: (_) => RouteAwareWidget(child: widget),
      settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}
