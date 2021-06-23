import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:ukeplanr_admin_dashboard/config/logs/logger.dart';
import 'package:ukeplanr_admin_dashboard/logic/logs/logService.dart';

void configureLogger() {
  // Init the flutter logger package to be able to show logs on screen
  LogConsole.init();
  // Set logger level based on log level
  Logger.level = LoggerConfig().getLogLevel;
  GetIt.instance.registerSingleton<LogsConfig>(
    LogsConfig(
      logger: LoggerConfig().getLogger,
    ),
  );
  final Function log = GetIt.instance.get<LogsConfig>().logger.log;
  FlutterError.onError = (FlutterErrorDetails error) => log(
        Level.error,
        """
      Encountered a ${error.library} error. 
      The context was ${error.context} 
      The following information was given: ${error.exception}. 
      """,
      );
}
