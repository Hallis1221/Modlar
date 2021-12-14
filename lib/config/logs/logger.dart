import 'package:logger/logger.dart';

class LogsConfig {
  final LogPrinter _logPrinter = PrettyPrinter(
    stackTraceBeginIndex: 2,
    methodCount: 1,
    errorMethodCount: 1,
    lineLength: 55,
    colors: true,
    printEmojis: true,
    printTime: true,
  );

  final Level _level = Level.debug;
  LogPrinter get getLogPrinter => _logPrinter;
  Level get getLogLevel => _level;
}
