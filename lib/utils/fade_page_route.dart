import 'package:flutter/material.dart';
import 'package:easy_rent/model/app_routes.dart';

class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == AppRoutes.authPage) {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
