import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ukeplanr_template/logic/logs/output/logOutput.dart';

class LogsService {
  final Logger? logger;
  Logger? get getLogger => logger;
  LogSession get getSession => GetIt.instance.get<LogSession>();

  LogsService({
    @required this.logger,
  });
}
