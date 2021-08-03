import 'package:ukeplanr_template/components/testing/debug/logsUI.dart';
import 'package:ukeplanr_template/components/testing/placeholder/helloWorld.dart';

import 'package:flutter/widgets.dart';
import 'package:ukeplanr_template/components/testing/theme/newTheme.dart';

class RoutesConfig {
  final Map<String, Widget> _routes = {
    "/": PlaceholderWidget(),
    "/session": DebugLogsUI(),
    "/theme": ThemeCreator(),
  };
  Map<String, Widget> get getRoutes => _routes;
}
