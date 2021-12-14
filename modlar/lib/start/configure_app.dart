import 'package:modlar/start/animation/configure_animation.dart';
import 'package:modlar/start/dev/configure_mode.dart';
import 'package:modlar/start/localization/configure_localization.dart';
import 'package:modlar/start/navigation/routes/configure_routes.dart';
import 'package:modlar/start/widgets/configure_initialization.dart';
import 'package:modlar/start/navigation/configure_navigation.dart';
import 'package:modlar/start/theme/configure_theme.dart';
import 'package:modlar/start/logs/configer_logger.dart';

Future<void> configureApp() async {
  configureLogger();
  configureInitialization();
  configureLocalization();
  configureNavigationWatcher();
  configureRoutes();
  configureAnimation();
  configureRunMode();
  await configureThemes();
}
