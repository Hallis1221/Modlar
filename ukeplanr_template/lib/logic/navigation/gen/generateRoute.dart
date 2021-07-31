import 'package:logger/logger.dart';
import 'package:ukeplanr_template/logic/navigation/observers/navigationWatcher.dart';
import 'package:ukeplanr_template/logic/navigation/mapping/findWidget.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

Route generateRoute(RouteSettings settings) {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;
  final NavigationWatcher navigationWatcher =
      GetIt.instance<NavigationWatcher>();
  final List<Map<String?, RouteSettings>> routeHistory =
      navigationWatcher.getRouteHistory;

  try {
    if (routeHistory.length == 0)
      navigationWatcher.registerRoute(settings);
    else
    // !! This might cause issues when passing arguments
    if (routeHistory[routeHistory.length - 1].keys.first != settings.name)
      navigationWatcher.registerRoute(settings);
    else
      log!(Level.info, """
          Did not register ${settings.name} beacuse the previous entry to the route history was also ${settings.name} 
          if this was not the intended behavior (for example if you tried to pass arguments) consider changing line 20 
          in generateRoute.dart to check for values instead of just keys.
          """);
  } catch (e) {
    log!(Level.error, """
        Tried to register ${settings.name} inside NavigationWatcher but got the following error: $e 
        """);
  }
  log!(Level.debug, """
      Navigating to ${settings.name} 
      """);
  return MaterialPageRoute(
    builder: (context) => findWidgetFromRoute(settings: settings),
  );
}
