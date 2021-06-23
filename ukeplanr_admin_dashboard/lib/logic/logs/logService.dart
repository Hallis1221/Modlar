import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Logs {
  final Logger? logger;

  Logger? get getLogger => logger;

  Logs({
    @required this.logger,
  });
}
