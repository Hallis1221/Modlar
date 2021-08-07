import 'package:ukeplanr_template/UI/components/errors/404.dart';
import 'package:ukeplanr_template/UI/screens/testing/auth/loggedOut.dart';
import 'package:ukeplanr_template/UI/screens/testing/home/helloWorld.dart';
import 'package:ukeplanr_template/UI/screens/testing/theme/newTheme.dart';
import 'package:ukeplanr_template/UI/screens/testing/debug/logsUI.dart';

import 'package:flutter/widgets.dart';
import 'package:ukeplanr_template/logic/auth/authService.dart';

class RoutesConfig {
  final Map<String, Widget> _routesLoggedIn = {
    "/": PlaceholderWidget(),
    "/session": DebugLogsUI(),
    "/theme": ThemeCreator(),
    "/404": PageNotFound(),
  };
  final Map<String, Widget> _routesLoggedOut = {
    "/": LoggedOut(),
    "/404": LoggedOut(),
  };
  final Widget shared404 = PageNotFound();

  Widget get get404 => shared404;
  Map<String, Widget> get getRoutesLoggedIn => _routesLoggedIn;
  Map<String, Widget> get getRoutedLoggedOut => _routesLoggedOut;
}
