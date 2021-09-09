import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/theme/custom/customTextTheme.dart';

// !! Each time a new property is added to custom theme it also have to be added to
// !! the toMap extension in extensions/themeData/asMap.dart. and extensios/map/asTheme.dart
class CustomTheme {
  // ignore_for_file: close_sinks
  ThemeData theme;
  String themeName;
  late BehaviorSubject<Color> backgroundColor =
      BehaviorSubject.seeded(theme.backgroundColor);
  late BehaviorSubject<Color> buttonColor =
      BehaviorSubject.seeded(theme.buttonColor);
  late BehaviorSubject<Color> primaryColor =
      BehaviorSubject.seeded(theme.primaryColor);
  late BehaviorSubject<CustomTextTheme> textTheme = BehaviorSubject.seeded(
    new CustomTextTheme(
      textTheme: theme.textTheme,
    ),
  );

  CustomTheme({
    required this.theme,
    required this.themeName,
  });
}
