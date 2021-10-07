import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigationWatcher extends NavigatorObserver {
  // todo implement custom tracking feature for pages

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      GetIt.instance.get<NavigationWatcher>().registerRoute(route.settings);

  /// The [Navigator] popped `route`.
  ///
  /// The route immediately below that one, and thus the newly active
  /// route, is `previousRoute`.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      GetIt.instance.get<NavigationWatcher>().registerRoute(route.settings);

  /// The [Navigator] removed `route`.
  ///
  /// If only one route is being removed, then the route immediately below
  /// that one, if any, is `previousRoute`.
  ///
  /// If multiple routes are being removed, then the route below the
  /// bottommost route being removed, if any, is `previousRoute`, and this
  /// method will be called once for each removed route, from the topmost route
  /// to the bottommost route.
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      GetIt.instance.get<NavigationWatcher>().registerRoute(route.settings);

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      GetIt.instance.get<NavigationWatcher>().registerRoute(newRoute!.settings);

  final List<Map<String?, RouteSettings>> _routeHistory =
      <Map<String?, RouteSettings>>[];

  List<Map<String?, RouteSettings>> get getRouteHistory => _routeHistory;
  void registerRoute(RouteSettings settings) =>
      _routeHistory.add(<String?, RouteSettings>{settings.name: settings});

  NavigationWatcher();
}
