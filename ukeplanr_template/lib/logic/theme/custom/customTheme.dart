import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

// !! Each time a new property is added to custom theme it also have to be added to
// !! the toMap extension in extensions/themeData/asMap.dart.
class CustomTheme {
  // ignore_for_file: close_sinks
  BuildContext context;
  late BehaviorSubject<Color> backgroundColor =
      BehaviorSubject.seeded(Theme.of(context).backgroundColor);
  late BehaviorSubject<Color> buttonColor =
      BehaviorSubject.seeded(Theme.of(context).buttonColor);

  CustomTheme({required this.context});
}
