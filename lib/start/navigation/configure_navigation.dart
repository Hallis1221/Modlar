import 'package:modlar/logic/navigation/observers/navigation_watcher.dart';
import 'package:modlar/logic/logs/printer/log_service.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureNavigationWatcher() {
  try {
    GetIt.instance.registerSingleton<NavigationWatcher>(
      NavigationWatcher(),
    );

    final Function? log = GetIt.instance.get<LogsService>().logger!.log;
    log!(Level.info, "Configured Navigation Watcher!");
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.error, """
          Failed to configure navigation watcher! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure themes and failed to log the exception! The error was: $e");
    }
  }
}
