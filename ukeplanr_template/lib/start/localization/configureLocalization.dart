import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

configureLocalization() {
  try {
    GetIt.instance.registerSingleton<LocaleName>(
      LocaleName(),
    );

    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.info, "Configured LocaleName!");
    } catch (e) {
      print(e);
    }
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.error, """
          Failed to configure LocaleName! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure LocaleName and failed to log the exception! The error was: $e");
    }
  }
}
