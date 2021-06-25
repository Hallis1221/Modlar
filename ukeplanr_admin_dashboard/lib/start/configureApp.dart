import 'package:flutter/widgets.dart';
import 'package:ukeplanr_admin_dashboard/start/logs/configerLogger.dart';
import 'package:ukeplanr_admin_dashboard/start/theme/configureTheme.dart';

configureApp() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {}

  configureLogger();
  configureThemes();
}
