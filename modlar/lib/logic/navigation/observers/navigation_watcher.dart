import 'package:flutter/material.dart';

class NavigationWatcher extends NavigatorObserver {
  // todo implement custom tracking feature for pages

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}

  final List<Map<String?, RouteSettings>> _routeHistory =
      <Map<String?, RouteSettings>>[];

  List<Map<String?, RouteSettings>> get getRouteHistory => _routeHistory;
  void registerRoute(RouteSettings settings) =>
      _routeHistory.add(<String?, RouteSettings>{settings.name: settings});

  NavigationWatcher();
}
