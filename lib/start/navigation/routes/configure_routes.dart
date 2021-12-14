import 'package:modlar/logic/logs/printer/log_service.dart';
import 'package:modlar/logic/navigation/routes/routes.dart';
import 'package:modlar/config/routes/routes.dart';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureRoutes() {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    RoutesConfig configRef = RoutesConfig();
    GetIt.instance.registerSingleton<RoutesService>(
      RoutesService(
        routesLoggedIn: configRef.getRoutesLoggedIn,
        routesLoggedOut: configRef.getRoutedLoggedOut,
        pageNotFoundWidget: configRef.get404,
      ),
    );
    log!(Level.info, "Configured Routes!");
  } catch (e) {
    log!(Level.error, """
          Failed to configure Routes! The following information was given: $e
          """);
  }
}
