import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/auth/auth_services.dart';

class RoutesService {
  final Map<String, Widget> routesLoggedIn;
  final Map<String, Widget> routesLoggedOut;
  final Widget pageNotFoundWidget;

  Widget get get404Widget {
    Widget? status404;
    if (AuthServices().isLoggedIn) {
      status404 = routesLoggedIn["/404"];
    } else {
      status404 = routesLoggedOut["/404"];
    }
    if (status404 != null) {
      return status404;
    } else {
      return pageNotFoundWidget;
    }
  }

  Map<String, Widget> get getRoutes {
    if (AuthServices().isLoggedIn) {
      return routesLoggedIn;
    } else {
      return routesLoggedOut;
    }
  }

  RoutesService({
    required this.routesLoggedIn,
    required this.routesLoggedOut,
    required this.pageNotFoundWidget,
  });
}
