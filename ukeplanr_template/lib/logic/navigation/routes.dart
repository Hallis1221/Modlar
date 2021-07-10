import 'package:flutter/material.dart';

class RoutesService {
  final Map<String, Widget>? routes;

  Map<String, Widget>? get getRoutes => routes;

  RouteSettings getCurrentString(BuildContext context) =>
      ModalRoute.of(context)!.settings;

  RoutesService({
    @required this.routes,
  });
}
