import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogsConfig {
  final Logger logger;

  Logger get getLogger => logger;

  LogsConfig({
    @required this.logger,
  });
}
