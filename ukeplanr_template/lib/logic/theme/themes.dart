import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/extensions/themeData/as_map.dart';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';

class ThemesService {
  final Map<String?, ThemeData?> themes;
  Map<String?, ThemeData?> get themesList => themes;

  // ignore: close_sinks
  final BehaviorSubject<ThemeData?> currentTheme;

  final String customThemePrefix;

  String currentThemeName;

  void setCurrentTheme(String themeName, String saveName) async {
    themeName = makeValidThemeName(themeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Function log = GetIt.instance.get<LogsService>().logger!.log;
    currentTheme.value = findTheme(themeName);
    currentThemeName = themeName;
    await prefs.setString("activeTheme", saveName);
    log(Level.info, "Set active theme to $saveName");
  }

  void addTheme(ThemeData theme, String themeName) {
    themeName = makeValidThemeName(themeName);
    themesList[themeName] = theme;
  }

  void saveAndSetTheme(String themeName) async {
    themeName = makeValidThemeName(themeName);
    String saveName = await saveTheme(themeName);
    setCurrentTheme(themeName, saveName);
  }

  // DOes something with [themeName]
  Future<String> saveTheme(String themeName) async {
    themeName = makeValidThemeName(themeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeMapAsString = jsonEncode(themesList[themeName]!.toMap());
    String saveName = "$customThemePrefix$themeName";
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
      savedThemes = [saveName];
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
  });
}
