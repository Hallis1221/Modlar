import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/theme/custom/customTextTheme.dart';

// !! Each time a new property is added to custom theme it also have to be added to
// !! the toMap extension in extensions/themeData/asMap.dart. and extensios/map/asTheme.dart
class CustomTheme {
  // ignore_for_file: close_sinks
  BuildContext context;
  late BehaviorSubject<Color> backgroundColor =
      BehaviorSubject.seeded(Theme.of(context).backgroundColor);
  late BehaviorSubject<Color> buttonColor =
      BehaviorSubject.seeded(Theme.of(context).buttonColor);
  late BehaviorSubject<CustomTextTheme> textTheme = BehaviorSubject.seeded(
    new CustomTextTheme(
      textTheme: Theme.of(context).textTheme,
    ),
  );

  CustomTheme({required this.context});
}
