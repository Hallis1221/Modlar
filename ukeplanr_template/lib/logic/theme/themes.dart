import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/extensions/map/as_theme.dart';
import 'package:ukeplanr_template/extensions/themeData/as_map.dart';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_theme.dart';

class ThemesService {
  Function log = GetIt.instance.get<LogsService>().logger!.log;

  final Map<String?, ThemeData?> themes;
  Map<String?, ThemeData?> get themesList => themes;

  final BehaviorSubject<CustomTheme?> currentCustomTheme;

  @Deprecated("Deprecated in favor of currentCustomTheme")
  final BehaviorSubject<ThemeData?> currentTheme;

  final String customThemePrefix;

  final Color debugColor;

  @Deprecated("Deprecated in favor of currentCustomTheme")
  String currentThemeName;

  Future<void> setActiveTheme(String themeName) async {
    // Get the current instance of sharedpreferences in order to save data to storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    themeName = makeValidThemeName(themeName);

    // Update internal class values
    currentCustomTheme.value!.theme = findTheme(themeName)!;
    currentCustomTheme.value!.themeName = themeName;

    // Update the stored active theme in order to preserve the current theme across sessions
    await prefs.setString("activeTheme", themeName);
    log(Level.info, "Set active theme to $themeName");
  }

  @Deprecated("setCurrentTheme is deprecated in favor of setActiveTheme")
  void setCurrentTheme(String themeName, String saveName) async {
    themeName = makeValidThemeName(themeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme.value = findTheme(themeName);
    currentThemeName = themeName;
    await prefs.setString("activeTheme", saveName);
    log(Level.info, "Set active theme to $saveName");
  }

  void _addTheme(CustomTheme customTheme) {
    // Will throw a error if customTheme.theme is null.
    ThemeData theme = customTheme.theme;
    String themeName = makeValidThemeName(customTheme.themeName);

    // Set the map member with key themeName to theme. This will add {themeName: theme} to the list of themes.
    themesList[themeName] = theme;
    log(Level.debug,
        "Added the following theme: ${theme.toMap()}/$theme with name $themeName");
  }

  Future<void> saveAndAddTheme(CustomTheme customTheme) async {
    _addTheme(customTheme);
  }

  Future<void> _saveTheme() async {}

  @Deprecated("addTheme is deprecated in favor of saveAndAddTheme.")
  Future<String> saveTheme(String themeName) async {
    themeName = makeValidThemeName(themeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeMapAsString = jsonEncode(themesList[themeName]!.toMap());
    await prefs.setString(themeName, themeMapAsString);
    // save the name of the saved theme
    List<String>? savedThemes = prefs.getStringList("savedThemes");
    if (savedThemes != null) {
      for (String savedTheme in savedThemes) {
        if (savedTheme == themeName) {
          savedThemes.remove(savedTheme);
        }
      }
      savedThemes.add(themeName);
    } else {
      savedThemes = <String>[themeName];
    }
    await prefs.setStringList("savedThemes", savedThemes);
    return themeName;
  }

  @Deprecated("addTheme is deprecated in favor of saveAndAddTheme.")
  void addTheme(ThemeData theme, String themeName) {
    themeName = makeValidThemeName(themeName);

    // Set the map member with key themeName to theme. This will add {themeName: theme} to the list of themes.
    themesList[themeName] = theme;
    log(Level.debug,
        "Added the following theme: ${theme.toMap()}/$theme with name $themeName");
  }

  void saveAndSetTheme(String themeName) async {
    await saveTheme(themeName);
    setActiveTheme(themeName);
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
        String themeName = savedTheme;

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

  String makeValidThemeName(String themeName) {
    return "$customThemePrefix${themeName.replaceAll("_", ".")}";
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
