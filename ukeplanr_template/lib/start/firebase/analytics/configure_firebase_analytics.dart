import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ukeplanr_template/logic/analytics/firebase_analytics.dart';
import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';

void configureAnalytics() {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    GetIt.instance.registerSingleton<AnalyticsService>(AnalyticsService(
      analyticsInstance: FirebaseAnalytics(),
    ));

    log!(Level.info, "Configured google analytics!");
  } catch (e) {
    try {
      log!(Level.error, """
          Failed to configure firebase analytics! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure firebase analytics and failed to log the exception! The error was: $e");
    }
  }
}
