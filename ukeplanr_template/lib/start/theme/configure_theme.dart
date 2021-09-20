import 'dart:convert';

import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';
import 'package:ukeplanr_template/extensions/map/as_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/config/theme/themes.dart';
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
      // List of strings that represent themes on shared preferences, can be null
      List<String>? savedThemesNullable = prefs.getStringList("savedThemes");
      List<String> savedThemes;
      // If savedThemesNullable is not null we can just set savedThemes to that
      if (savedThemesNullable != null) {
        savedThemes = savedThemesNullable;
      } else {
        savedThemes = <String>[];
      }
      for (String savedTheme in savedThemes) {
        // Get the json encoded version of the saved themeData
        String? themeDataEncoded = prefs.getString(savedTheme);
        if (themeDataEncoded != null) {
          Map<String, String> themeData = jsonDecode(themeDataEncoded);
          // A themename is a savedThemeName just without the prefix.
          // Therefor we remove the prefix
          String themeName =
              savedTheme.replaceAll(ThemeConfig().customThemePrefix, "");
          ThemesService themesServiceInstance =
              GetIt.instance.get<ThemesService>();
          themesServiceInstance.addTheme(themeData.toTheme(), themeName);
          themesServiceInstance.setCurrentTheme(themeName, savedTheme);
          log(Level.info, """
          Sucsesfully loaded the theme '$themeName' from its save location 
          at '$savedTheme' with the following data: '$themeData' and converted 
          it to themedata and set it as the active theme (${themeData.toTheme()}).
          """);
        }
      }
    } catch (error) {
      log(Level.error,
          "Failed to get themes with the following exception: $error");
    }
  });
}
