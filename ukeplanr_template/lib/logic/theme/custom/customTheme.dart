import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CustomTheme {
  // ignore: close_sinks
  BehaviorSubject<Color> backgroundColor;

  CustomTheme({required this.backgroundColor});
}
