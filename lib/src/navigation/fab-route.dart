import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux_thunk_boilerplate/src/navigation/route-aware-widget.dart';

class FabRoute<T> extends MaterialPageRoute<T> {
  FabRoute(Widget widget, {RouteSettings settings})
      : super(builder: (_) => RouteAwareWidget(child: widget), settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // if (settings.isInitialRoute) return child;
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
