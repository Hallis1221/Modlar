import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:ukeplanr_admin_dashboard/config/logs/logger.dart';
import 'package:ukeplanr_admin_dashboard/config/theme/themes.dart';
import 'package:ukeplanr_admin_dashboard/logic/logs/logService.dart';
import 'package:ukeplanr_admin_dashboard/logic/theme/themes.dart';

void configureThemes() {
  GetIt.instance.registerSingleton<ThemeConfig>(
    ThemeConfig(
      defaultTheme: Themes().getDefaultTheme,
    ),
  );
  final Function log = GetIt.instance.get<LogsConfig>().logger.log;
  log(Level.info, "Configured Themes!");
}
