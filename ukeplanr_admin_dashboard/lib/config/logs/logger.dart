import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Logs {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 3,
      lineLength: 55,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  final Level _level = Level.debug;
  Logger get getLogger => _logger;
  Level get getLogLevel => _level;
}
