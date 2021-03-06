import 'package:shared_preferences/shared_preferences.dart';
import 'package:modlar/config/shared%20preferences/shared_prefs_keys.dart';
import 'package:modlar/logic/logs/printer/log_service.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class LocaleName {
  final BehaviorSubject<Locale?> _localeName =
      BehaviorSubject<Locale?>.seeded(null);

  String get getLocaleName => _localeName.value.toString();
  Stream<Locale?>? get stream$ => _localeName.stream;

  Future<void> changeLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Function? _log = GetIt.instance.get<LogsService>().logger!.log;

    if (_localeName.value == locale) {
      _log!(Level.error,
          "Locale was not changed because locale already is $locale. ($locale is the same as ${_localeName.value})");
    } else {
      _log!(Level.debug, "Changed locale from ${_localeName.value} to $locale");
      _localeName.value = locale;
      prefs.setString(SharedPrefsKeys().activeLocaleKey, locale.toString());
    }
  }

  LocaleName();
}
