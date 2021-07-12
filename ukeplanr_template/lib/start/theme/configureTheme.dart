import 'package:ukeplanr_template/config/theme/themes.dart';

import 'package:ukeplanr_template/logic/logs/logService.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void configureThemes() {
  // Get the logservice from getit then accessing the log function directly
  // from the logger object. Then we can directly call the log function
  // later in the code without doing logger.log. We can pass a level by doing
  // (Level.level, "message") or we can let the LogsService find a level by doing
  // ("message") without passing a level.
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;

  try {
    // Register ThemesService with GetIt.
    // When registering it we pass the default theme from the theme configuration
    // to the themeservice.
    GetIt.instance.registerSingleton<ThemesService>(
      ThemesService(
        defaultTheme: ThemeConfig().getDefaultTheme,
      ),
    );
    log!(Level.info, "Configured Themes!");
  } catch (e) {
    try {
      log!(Level.info,
          """Failed to configure Themes! The following information was given: $e""");
    } catch (e) {}
  }
}
