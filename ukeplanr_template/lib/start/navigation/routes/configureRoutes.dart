import 'package:ukeplanr_template/config/routes/routes.dart';

import 'package:ukeplanr_template/logic/logs/printer/logService.dart';
import 'package:ukeplanr_template/logic/navigation/routes/routes.dart';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureRoutes() {
  try {
    GetIt.instance.registerSingleton<RoutesService>(
      RoutesService(
        routes: RoutesConfig().getRoutes,
      ),
    );
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.info, "Configured Routes!");
    } catch (e) {}
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.error, """
          Failed to configure Routes! The following information was given: $e
          """);
    } catch (e) {}
  }
}
