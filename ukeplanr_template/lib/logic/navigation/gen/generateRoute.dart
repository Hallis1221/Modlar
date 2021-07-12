import 'package:ukeplanr_template/logic/navigation/observers/navigationWatcher.dart';
import 'package:ukeplanr_template/logic/navigation/mapping/findWidget.dart';
import 'package:ukeplanr_template/logic/logs/logService.dart';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

Route generateRoute(RouteSettings settings) {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    GetIt.instance<NavigationWatcher>().registerRoute(settings);
  } catch (e) {
    log!("""
        Tried to register ${settings.name} inside NavigationWatcher but got the following error: $e 
        """);
  }
  return MaterialPageRoute(
    builder: (context) => findWidgetFromRoute(settings: settings),
  );
}
