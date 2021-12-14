import 'package:modlar/logic/logs/printer/log_service.dart';
import 'package:modlar/logic/logs/output/log_output.dart';
import 'package:modlar/config/logs/logger.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureLogger() {
  // Init the flutter logger package to be able to show logs on screen
  // Set logger level based on log level
  Logger.level = LogsConfig().getLogLevel;
  try {
    GetIt.instance.registerSingleton<LogsService>(
      LogsService(
        logger: Logger(
          output: LogSession(),
          printer: LogsConfig().getLogPrinter,
        ),
      ),
    );
  } catch (error) {
    GetIt.instance.get<LogsService>().logger!.log(Level.warning,
        "Encountered a error while registering logSession. The following information was given: $error.");
  }
  try {
    GetIt.instance.registerSingleton<LogSession>(
      LogSession(),
    );
  } catch (error) {
    GetIt.instance.get<LogsService>().logger!.log(Level.warning,
        "Encountered a error while registering logSession. The following information was given: $error.");
  }
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;
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
