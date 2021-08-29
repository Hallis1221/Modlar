import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

configureLocalization() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    GetIt.instance.registerSingleton<LocaleName>(
      LocaleName(),
    );
    try {
      String? storedLocale = prefs.getString("activeLocale");
      if (storedLocale != null) {
        List localeStrings = storedLocale.split("_");
        GetIt.instance
            .get<LocaleName>()
            .changeLocale(Locale(localeStrings[0], localeStrings[1]));
      }
    } catch (error) {
      log!(Level.error,
          "Tried to get and use the active locale but got the following error: $error");
    }

    try {
      log!(Level.info, "Configured LocaleName!");
    } catch (e) {
      print("Failed to configure LocaleName with exception: $e");
    }
  } catch (e) {
    try {
      log!(Level.error, """
          Failed to configure LocaleName! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure LocaleName and failed to log the exception! The error was: $e");
    }
  }
}
