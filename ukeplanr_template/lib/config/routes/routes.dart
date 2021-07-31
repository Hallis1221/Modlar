import 'package:ukeplanr_template/components/testing/placeholder/helloWorld.dart';

import 'package:flutter/widgets.dart';

class RoutesConfig {
  final Map<String, Widget> _routes = {
    "/": PlaceholderWidget(),
  };
  Map<String, Widget> get getRoutes => _routes;
}
