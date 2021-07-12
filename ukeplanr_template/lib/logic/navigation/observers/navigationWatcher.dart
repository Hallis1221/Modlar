import 'package:flutter/material.dart';

class NavigationWatcher extends NavigatorObserver {
  // todo implement custom tracking feature for pages

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print("ok so something replaced");
  }

  List<Map<String?, RouteSettings>> _routeHistory = [];

  List<Map<String?, RouteSettings>> get getRouteHistory => _routeHistory;
  void registerRoute(RouteSettings settings) =>
      _routeHistory.add({settings.name: settings});

  NavigationWatcher();
}
