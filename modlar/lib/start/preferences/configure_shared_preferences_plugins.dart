// import 'package:modlar/generated_plugin_registrant.dart';
import 'package:modlar/logic/logs/printer/log_service.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureNavigationWatcher() {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    // registerPlugins():

    log!(Level.info, "Configured shared preference plugins!");
  } catch (e) {
    try {
      log!(Level.error, """
          Failed to configure shared preference plugins! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure shared preference plugins and failed to log the exception! The error was: $e");
    }
  }
}
