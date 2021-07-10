import 'package:ukeplanr_template/start/logs/configerLogger.dart';
import 'package:ukeplanr_template/start/theme/configureTheme.dart';

import 'package:flutter/widgets.dart';

configureApp() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {}

  configureLogger();
  configureThemes();
}
