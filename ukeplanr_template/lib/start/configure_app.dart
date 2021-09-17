import 'package:ukeplanr_template/start/animation/configure_animation.dart';
import 'package:ukeplanr_template/start/dev/configure_mode.dart';
import 'package:ukeplanr_template/start/localization/configure_localization.dart';
import 'package:ukeplanr_template/start/navigation/routes/configure_routes.dart';
import 'package:ukeplanr_template/start/widgets/configure_initialization.dart';
import 'package:ukeplanr_template/start/navigation/configure_navigation.dart';
import 'package:ukeplanr_template/start/theme/configure_theme.dart';
import 'package:ukeplanr_template/start/logs/configer_logger.dart';

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