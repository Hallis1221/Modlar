import 'package:logger/logger.dart';

class LogsConfig {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 1,
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
