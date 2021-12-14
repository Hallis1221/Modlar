// import 'package:ukeplanr_template/generated_plugin_registrant.dart';
import 'package:ukeplanr_template/config/dev/dev.dart';
import 'package:ukeplanr_template/logic/dev/mode.dart';
import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureRunMode() {
  try {
    GetIt.instance.registerSingleton<RunMode>(
      RunMode(
        showBanner:
            (RunModeConfig().runMode == "" || !RunModeConfig().showBanner)
                ? false
                : true,
        runMode: RunModeConfig().runMode,
      ),
    );
    final Function? log = GetIt.instance.get<LogsService>().logger!.log;
    log!(Level.info, "Configured shared preference plugins!");
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
