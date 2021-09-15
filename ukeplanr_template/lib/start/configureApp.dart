import 'package:ukeplanr_template/start/animation/configureAnimation.dart';
import 'package:ukeplanr_template/start/localization/configureLocalization.dart';
import 'package:ukeplanr_template/start/navigation/routes/configureRoutes.dart';
import 'package:ukeplanr_template/start/widgets/configureInitialization.dart';
import 'package:ukeplanr_template/start/navigation/configureNavigation.dart';
import 'package:ukeplanr_template/start/theme/configureTheme.dart';
import 'package:ukeplanr_template/start/logs/configerLogger.dart';

Future<void> configureApp() async {
  configureLogger();
  configureInitialization();
  configureLocalization();
  configureNavigationWatcher();
  configureRoutes();
  configureAnimation();
  await configureThemes();
}
