import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/extensions/map/as_theme.dart';
import 'package:ukeplanr_template/extensions/themeData/as_map.dart';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';

class ThemesService {
  Function log = GetIt.instance.get<LogsService>().logger!.log;

  final Map<String?, ThemeData?> themes;
  Map<String?, ThemeData?> get themesList => themes;

  final BehaviorSubject<ThemeData?> currentTheme;

  final String customThemePrefix;

  final Color debugColor;

  String currentThemeName;

  void setCurrentTheme(String themeName, String saveName) async {
    themeName = makeValidThemeName(themeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme.value = findTheme(themeName);
    currentThemeName = themeName;
    await prefs.setString("activeTheme", saveName);
    log(Level.info, "Set active theme to $saveName");
  }

  void addTheme(ThemeData theme, String themeName) {
    themeName = makeValidThemeName(themeName);
    log(Level.debug,
        "Adding the following theme: ${theme.toMap()}/$theme with name $themeName");
    themesList[themeName] = theme;
  }

  void saveAndSetTheme(String themeName) async {
    themeName = makeValidThemeName(themeName);
    String saveName = await saveTheme(themeName);
    setCurrentTheme(themeName, saveName);
  }

  void loadThemes(SharedPreferences prefs) {
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
        Map<String, dynamic> themeData = jsonDecode(themeDataEncoded);
        // A themename is a savedThemeName just without the prefix.
        // Therefor we remove the prefix
        String themeName = savedTheme.replaceAll(customThemePrefix, "");

        addTheme(themeData.toTheme(), themeName);
        setCurrentTheme(themeName, savedTheme);
        log(Level.info, """
          Sucsesfully loaded the theme '$themeName' from its save location 
          at '$savedTheme' with the following data: '$themeData' and converted 
          it to themedata and set it as the active theme (${themeData.toTheme()}).
          """);
      }
    }
  }

  // DOes something with [themeName]
  Future<String> saveTheme(String themeName) async {
    themeName = makeValidThemeName(themeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeMapAsString = jsonEncode(themesList[themeName]!.toMap());
    String saveName = "$customThemePrefix$themeName";
    print("json encoded: $themeMapAsString");
    await prefs.setString(saveName, themeMapAsString);
    // save the name of the saved theme
    List<String>? savedThemes = prefs.getStringList("savedThemes");
    if (savedThemes != null) {
      for (String savedTheme in savedThemes) {
        if (savedTheme == saveName) {
          savedThemes.remove(savedTheme);
        }
      }
      savedThemes.add(saveName);
    } else {
      savedThemes = <String>[saveName];
    }
    await prefs.setStringList("savedThemes", savedThemes);
    return "$customThemePrefix$themeName";
  }

  String makeValidThemeName(String themeName) {
    return themeName.replaceAll("_", ".");
  }

  ThemeData? findTheme(String themeName) {
    themeName = makeValidThemeName(themeName);
    return themesList[themeName];
  }

  ThemesService({
    required this.themes,
    required this.currentTheme,
    required this.currentThemeName,
    required this.customThemePrefix,
    this.debugColor = Colors.transparent,
  });
}
