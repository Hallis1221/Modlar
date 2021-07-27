import 'package:ukeplanr_template/logic/logs/logService.dart';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class LocaleName {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  // ignore: close_sinks
  BehaviorSubject localeName;

  Stream get stream$ => localeName.stream;

  changeLocale(String locale) {
    log!("Changed locale from ${localeName.value} to $locale");
    localeName.value = BehaviorSubject.seeded(locale);
  }

  LocaleName({required this.localeName});
}
