import 'package:ukeplanr_template/logic/logs/printer/log_service.dart';
import 'package:ukeplanr_template/logic/navigation/routes/routes.dart';
import 'package:ukeplanr_template/config/routes/routes.dart';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureRoutes() {
  try {
    RoutesConfig configRef = RoutesConfig();
    GetIt.instance.registerSingleton<RoutesService>(
      RoutesService(
        routesLoggedIn: configRef.getRoutesLoggedIn,
        routesLoggedOut: configRef.getRoutedLoggedOut,
        pageNotFoundWidget: configRef.get404,
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
