import 'package:ukeplanr_template/logic/navigation/observers/navigationWatcher.dart';
import 'package:ukeplanr_template/logic/logs/logService.dart';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureNavigationWatcher() {
  try {
    GetIt.instance.registerSingleton<NavigationWatcher>(
      NavigationWatcher(),
    );
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.info, "Configured Navigation Watcher!");
    } catch (e) {}
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.error, """
          Failed to configure navigation watcher! The following information was given: $e
          """);
    } catch (e) {}
  }
}
