import 'package:ukeplanr_template/UI/screens/testing/debug/logsUI.dart';
import 'package:ukeplanr_template/UI/screens/testing/placeholder/helloWorld.dart';
import 'package:ukeplanr_template/UI/screens/testing/theme/newTheme.dart';

import 'package:flutter/widgets.dart';

class RoutesConfig {
  final Map<String, Widget> _routes = {
    "/": PlaceholderWidget(),
    "/session": DebugLogsUI(),
    "/theme": ThemeCreator(),
  };
  Map<String, Widget> get getRoutes => _routes;
}
