import 'package:flutter/widgets.dart';
import 'package:ukeplanr_admin_dashboard/start/logs/configerLogger.dart';
import 'package:ukeplanr_admin_dashboard/start/theme/configureTheme.dart';

Future<void> configureApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureLogger();
  configureThemes();
}
