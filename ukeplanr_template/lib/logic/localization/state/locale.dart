import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class LocaleName {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  // ignore: close_sinks
  BehaviorSubject<Locale?> _localeName = BehaviorSubject.seeded(null);

  Stream<Locale?>? get stream$ => _localeName.stream;

  changeLocale(Locale locale) {
    log!(Level.debug, "Changed locale from ${_localeName.value} to $locale");
    _localeName.value = locale;
  }

  LocaleName();
}