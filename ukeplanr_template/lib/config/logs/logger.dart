import 'package:logger/logger.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

class LogsConfig {
  final LogPrinter _logPrinter = PrettyPrinter(
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
