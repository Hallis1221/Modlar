import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ukeplanr_admin_dashboard/config/logs/logger.dart';
import 'package:ukeplanr_admin_dashboard/config/theme/themes.dart';
import 'package:ukeplanr_admin_dashboard/logic/logs/logService.dart';
import 'package:ukeplanr_admin_dashboard/logic/theme/themes.dart';

void configureThemes() {
  try {
    GetIt.instance.registerSingleton<Themes>(
      Themes(
        defaultTheme: ThemeConfig().getDefaultTheme,
      ),
    );
    try {
      final Function? log = GetIt.instance.get<Logs>().logger!.log;
      log!(Level.info, "Configured Themes!");
    } catch (e) {}
  } catch (e) {
    try {
      final Function? log = GetIt.instance.get<Logs>().logger!.log;
      log!(Level.info,
          "Failed to configure Themes! The following information was given: $e");
    } catch (e) {}
  }
}
