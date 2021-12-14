import 'package:modlar/logic/logs/printer/log_service.dart';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

void configureInitialization() {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (error) {
    log!("""
        Caught an error during initialization. 
        The following information was given: $error
        """);
  }
}
