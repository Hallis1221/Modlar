import 'package:ukeplanr_template/config/theme/themes.dart';
import 'package:ukeplanr_template/logic/logs/logService.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureThemes() {
  try {
    GetIt.instance.registerSingleton<ThemesService>(
      ThemesService(
        defaultTheme: ThemeConfig().getDefaultTheme,
      ),
    );
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.info, "Configured Themes!");
    } catch (e) {}
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<LogsService>().logger!.log;
      log!(Level.info,
          "Failed to configure Themes! The following information was given: $e");
    } catch (e) {}
  }
}
