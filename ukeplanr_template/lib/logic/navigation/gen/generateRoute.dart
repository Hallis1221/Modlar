import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/navigation/mapping/findWidget.dart';

Route generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => findWidgetFromRoute(settings: settings),
  );
}