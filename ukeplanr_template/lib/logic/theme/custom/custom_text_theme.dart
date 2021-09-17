import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomTextTheme {
  TextTheme textTheme;
  late BehaviorSubject<TextStyle?> bodyText1 =
      BehaviorSubject.seeded(textTheme.bodyText1);
  late BehaviorSubject<TextStyle?> bodyText2 =
      BehaviorSubject.seeded(textTheme.bodyText2);
  late BehaviorSubject<TextStyle?> button =
      BehaviorSubject.seeded(textTheme.button);
  late BehaviorSubject<TextStyle?> caption =
      BehaviorSubject.seeded(textTheme.caption);
  late BehaviorSubject<TextStyle?> headline1 =
      BehaviorSubject.seeded(textTheme.headline1);
  late BehaviorSubject<TextStyle?> headline2 =
      BehaviorSubject.seeded(textTheme.headline2);
  late BehaviorSubject<TextStyle?> headline3 =
      BehaviorSubject.seeded(textTheme.headline3);
  late BehaviorSubject<TextStyle?> headline4 =
      BehaviorSubject.seeded(textTheme.headline4);
  late BehaviorSubject<TextStyle?> headline5 =
      BehaviorSubject.seeded(textTheme.headline5);
  late BehaviorSubject<TextStyle?> headline6 =
      BehaviorSubject.seeded(textTheme.headline6);
  late BehaviorSubject<TextStyle?> overline =
      BehaviorSubject.seeded(textTheme.overline);
  late BehaviorSubject<TextStyle?> subtitle1 =
      BehaviorSubject.seeded(textTheme.subtitle1);
  late BehaviorSubject<TextStyle?> subtitle2 =
      BehaviorSubject.seeded(textTheme.subtitle2);

  CustomTextTheme({required this.textTheme});
}
