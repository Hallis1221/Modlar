import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogsService {
  final Logger? logger;
  Logger? get getLogger => logger;

  LogsService({
    @required this.logger,
  });
}
