import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomTextTheme {
  TextTheme textTheme;
  late BehaviorSubject<TextStyle?> bodyText1 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.bodyText1);
  late BehaviorSubject<TextStyle?> bodyText2 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.bodyText2);
  late BehaviorSubject<TextStyle?> button =
      BehaviorSubject<TextStyle?>.seeded(textTheme.button);
  late BehaviorSubject<TextStyle?> caption =
      BehaviorSubject<TextStyle?>.seeded(textTheme.caption);
  late BehaviorSubject<TextStyle?> headline1 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.headline1);
  late BehaviorSubject<TextStyle?> headline2 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.headline2);
  late BehaviorSubject<TextStyle?> headline3 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.headline3);
  late BehaviorSubject<TextStyle?> headline4 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.headline4);
  late BehaviorSubject<TextStyle?> headline5 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.headline5);
  late BehaviorSubject<TextStyle?> headline6 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.headline6);
  late BehaviorSubject<TextStyle?> overline =
      BehaviorSubject<TextStyle?>.seeded(textTheme.overline);
  late BehaviorSubject<TextStyle?> subtitle1 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.subtitle1);
  late BehaviorSubject<TextStyle?> subtitle2 =
      BehaviorSubject<TextStyle?>.seeded(textTheme.subtitle2);

  CustomTextTheme({required this.textTheme});
}
