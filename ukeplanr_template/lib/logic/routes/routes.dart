import 'package:flutter/material.dart';

class RoutesService {
  final Map<String, Widget>? routes;

  Map<String, Widget>? get getRoutes => routes;

  RoutesService({
    @required this.routes,
  });
}
