import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomTheme {
  BehaviorSubject<Color> backgroundColor;
  BehaviorSubject<Color> buttonColor;

  CustomTheme({required this.backgroundColor, required this.buttonColor});
}
