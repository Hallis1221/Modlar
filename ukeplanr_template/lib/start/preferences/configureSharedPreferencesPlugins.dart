import 'package:ukeplanr_template/logic/logs/printer/logService.dart';
import 'package:ukeplanr_template/generated_plugin_registrant.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureNavigationWatcher() {
  try {
    // registerPlugins():
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.info, "Configured shared preference plugins!");
    } catch (e) {}
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.error, """
          Failed to configure shared preference plugins! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure shared preference plugins and failed to log the exception! The error was: $e");
    }
  }
}
