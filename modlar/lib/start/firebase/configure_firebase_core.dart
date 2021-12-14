import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';

Future<void> configureFirebaseCore() async {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    await Firebase.initializeApp();

    log!(Level.info, "Configured firebase core!");
  } catch (e) {
    try {
      log!(Level.error, """
          Failed to configure firebase core! The following information was given: $e
          """);
    } catch (e) {
      throw FlutterError(
          "Failed to configure firebase core and failed to log the exception! The error was: $e");
    }
  }
}
