import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/config/theme/themes.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_theme.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

Future<void> configureThemes() async {
  // Get the logservice from getit then accessing the log function directly
  // from the logger object. Then we can directly call the log function
  // later in the code without doing logger.log. We can pass a level by doing
  // (Level.level, "message") or we can let the LogsService find a level by doing
  // ("message") without passing a level.
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  SharedPreferences.getInstance().then((SharedPreferences prefs) {
    try {
      // Register ThemesService with GetIt.
      // When registering it we pass the default theme from the theme configuration
      // to the themeservice.
      GetIt.instance.registerSingleton<ThemesService>(
        ThemesService(
          themes: ThemeConfig().themes,
          currentTheme: BehaviorSubject<ThemeData?>.seeded(
              ThemeConfig().themes["orange"]),
          customThemePrefix: ThemeConfig().customThemePrefix,
          currentThemeName: 'orange',
          debugColor: ThemeConfig().debugColor,
          saveThemePrefix: ThemeConfig().saveThemePrefix,
          currentCustomTheme: BehaviorSubject<CustomTheme>.seeded(
            CustomTheme(
              theme: BehaviorSubject<ThemeData?>.seeded(
                  ThemeConfig().themes["orange"]),
              themeName: "orange",
            ),
          ),
        ),
      );
      log!(Level.info, "Configured Themes!");
    } catch (e) {
      try {
        log!(Level.info,
            """Failed to configure Themes! The following information was given: $e""");
      } catch (e) {
        throw FlutterError(
            "Failed to configure themes and failed to log the exception! The error was: $e");
      }
    }
    try {
      GetIt.instance.get<ThemesService>().loadThemesFromStorage(prefs);
    } catch (error) {
      log(Level.error,
          "Failed to get themes with the following exception: $error");
    }
  });
}
