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

  final BehaviorSubject<Map<String?, ThemeData?>> themes;
  Map<String?, ThemeData?> get themesList => themes.value;

  final BehaviorSubject<CustomTheme?> currentCustomTheme;

  final String customThemePrefix;
  final String saveThemePrefix;

  final Color debugColor;

  Future<void> setActiveTheme(String themeName) async {
    // Get the current instance of sharedpreferences in order to save data to storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    themeName = makeValidThemeName(themeName);

    // Update internal class values
    currentCustomTheme.value!.theme.value = findTheme(themeName)!;
    currentCustomTheme.value!.themeName = themeName;

    // Update the stored active theme in order to preserve the current theme across sessions
    await prefs.setString("activeTheme", themeName);
    log(Level.info, "Set active theme to $themeName");
  }

  void _addTheme(CustomTheme customTheme) {
    // Will throw an error if customTheme.theme is null.
    ThemeData? theme = customTheme.theme.value;
    String themeName = makeValidThemeName(customTheme.themeName);

    // Set the map member with key themeName to theme. This will add {themeName: theme} to the list of themes.
    themesList[themeName] = theme;
    log(Level.debug,
        "Added the following theme: ${theme!.toMap()}/$theme with name $themeName");
  }

  Future<void> saveAndAddTheme(CustomTheme customTheme) async {
    _addTheme(customTheme);
    await _saveTheme(customTheme.themeName);
  }

  Future<void> _saveTheme(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    themeName = makeValidThemeName(themeName);
    String saveName = makeValidSaveName(themeName);

    // Get the themeData for the passed themeName
    String themeDataAsJSON = jsonEncode(themesList[themeName]!.toMap());

    await prefs.setString(saveName, themeDataAsJSON);

    await _addThemeToSavedThemes(prefs, themeName);
  }

  /// Adds passed themeName to the stored list of savedThemes. Follows the Get, Change, Set principle.
  Future<void> _addThemeToSavedThemes(
      SharedPreferences prefs, String newthemeName) async {
    // GET.
    // Get the exsisting list from storage
    List<String>? savedThemes = prefs.getStringList("savedThemes");

    // CHANGE.
    // Remove other entries of newThemeName and add ours, for it to be the right order.
    savedThemes != null
        ? // Remove previous instances to not get two entries with the same value
        savedThemes.removeWhere(
            (String savedThemeName) => savedThemeName == newthemeName)
        :
        // If savedThemes does not exsist, create it so we can add our new entry to it later
        savedThemes = <String>[];
    // Add the new entry to the list
    savedThemes.add(newthemeName);

    // SET.
    // Set our new list as the value saved on storage.
    await prefs.setStringList("savedThemes", savedThemes);
  }

  Future<void> loadThemesFromStorage(SharedPreferences prefs) async {
    List<String>? savedThemes = prefs.getStringList("savedThemes");

    // If savedThemes is null (IE savedThemes did not exsist on sharedPreferences) then set it to a empty list
    savedThemes ??= <String>[];

    for (String saveName in savedThemes) {
      // Get the json encoded version of the saved themeData
      String? themeDataEncoded = prefs.getString(saveName);

      // If the savedTheme did not exsist as a savedTHeme
      // (IE a bug added a theme that was not saved to the list over savedThemes)
      // then skip this element in the for loop
      if (themeDataEncoded == null) {
        continue;
      }

      Map<String, dynamic> themeData = jsonDecode(themeDataEncoded);
      String themeName = convertSaveNameToThemeName(saveName);
      _addTheme(CustomTheme(
          theme: BehaviorSubject<ThemeData>.seeded(themeData.toTheme()),
          themeName: themeName));
      setActiveTheme(themeName);
      log(Level.info, """
          Sucsesfully loaded the theme '$themeName' from its save location 
          at '$saveName' with the following data: '$themeData' and converted 
          it to themedata and set it as the active theme (${themeData.toTheme()}).
          """);
    }
  }

  String makeValidThemeName(String themeName) {
    themeName = themeName.replaceAll(customThemePrefix, "");
    return "$customThemePrefix${themeName.replaceAll("_", ".")}";
  }

// Custom themes should call makeValidThemeName before this one
  String makeValidSaveName(String themeName) {
    return "$saveThemePrefix$themeName";
  }

  String convertSaveNameToThemeName(String themeName) {
    return themeName.replaceAll(saveThemePrefix, "");
  }

  ThemeData? findTheme(String themeName) {
    return themesList[themeName];
  }

  ThemesService({
    required this.themes,
    required this.customThemePrefix,
    required this.currentCustomTheme,
    required this.saveThemePrefix,
    this.debugColor = Colors.transparent,
  });
}
