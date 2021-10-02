import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomColorScheme {
  ColorScheme colorScheme;
  late BehaviorSubject<Color> background =
      BehaviorSubject<Color>.seeded(colorScheme.background);
  late BehaviorSubject<Color> error =
      BehaviorSubject<Color>.seeded(colorScheme.error);
  late BehaviorSubject<Color> onBackground =
      BehaviorSubject<Color>.seeded(colorScheme.onBackground);
  late BehaviorSubject<Color> onError =
      BehaviorSubject<Color>.seeded(colorScheme.onError);
  late BehaviorSubject<Color> onPrimary =
      BehaviorSubject<Color>.seeded(colorScheme.onPrimary);
  late BehaviorSubject<Color> onSecondary =
      BehaviorSubject<Color>.seeded(colorScheme.onSecondary);
  late BehaviorSubject<Color> onSurface =
      BehaviorSubject<Color>.seeded(colorScheme.onSurface);
  late BehaviorSubject<Color> primary =
      BehaviorSubject<Color>.seeded(colorScheme.primary);
  late BehaviorSubject<Color> primaryVariant =
      BehaviorSubject<Color>.seeded(colorScheme.primaryVariant);
  late BehaviorSubject<Color> secondary =
      BehaviorSubject<Color>.seeded(colorScheme.secondary);
  late BehaviorSubject<Color> secondaryVariant =
      BehaviorSubject<Color>.seeded(colorScheme.secondaryVariant);
  late BehaviorSubject<Color> surface =
      BehaviorSubject<Color>.seeded(colorScheme.surface);
  late BehaviorSubject<Brightness> brightness =
      BehaviorSubject<Brightness>.seeded(colorScheme.brightness);

  CustomColorScheme({required this.colorScheme});
}
