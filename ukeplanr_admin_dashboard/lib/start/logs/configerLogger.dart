import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ukeplanr_admin_dashboard/config/logs/logger.dart';
import 'package:ukeplanr_admin_dashboard/logic/logs/logService.dart';

void configureLogger() {
  // Init the flutter logger package to be able to show logs on screen
  // Set logger level based on log level
  Logger.level = LogsConfig().getLogLevel;
  try {
    GetIt.instance.registerSingleton<Logs>(
      Logs(
        logger: LogsConfig().getLogger,
      ),
    );
  } catch (error) {
    GetIt.instance.get<Logs>().logger!.log(Level.warning,
        "Encountered a error while registering logger. The following information was given: $error.");
  }
  final Function? log = GetIt.instance.get<Logs>().logger!.log;
  FlutterError.onError = (FlutterErrorDetails? error) => log!(
        Level.error,
        """
      Encountered a ${error!.library} error. 
      The context was ${error.context} 
      The following information was given: ${error.exception}. 
      """,
      );
  log!(Level.info, "Configured Logs!");
}
