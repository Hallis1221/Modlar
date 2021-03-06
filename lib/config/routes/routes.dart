import 'package:modlar/UI/components/errors/page_not_found.dart';
import 'package:modlar/UI/screens/testing/arguments/test_with_arguments.dart';
import 'package:modlar/UI/screens/testing/auth/logged_out.dart';
import 'package:modlar/UI/screens/testing/home/hello_world.dart';
import 'package:modlar/UI/screens/testing/styles/glass_background_test.dart';
import 'package:modlar/UI/screens/testing/theme/new_theme.dart';
import 'package:modlar/UI/screens/testing/debug/logs_ui.dart';

import 'package:flutter/widgets.dart';

class RoutesConfig {
  final Map<String, Widget> _routesLoggedIn = <String, Widget>{
    "/": const PlaceholderWidget(),
    "/home": const PlaceholderWidget(),
    "/session": const DebugLogsUI(),
    "/theme": const ThemeCreator(),
    "/404": const PageNotFound(),
    "/glass": const GlassBackgroundPage(),
    "/test": const ExtractArgumentsScreen(),
  };
  final Map<String, Widget> _routesLoggedOut = <String, Widget>{
    "/": const LoggedOut(),
    "/404": const LoggedOut(),
  };
  final Widget shared404 = const PageNotFound();

  Widget get get404 => shared404;
  Map<String, Widget> get getRoutesLoggedIn => _routesLoggedIn;
  Map<String, Widget> get getRoutedLoggedOut => _routesLoggedOut;
}
