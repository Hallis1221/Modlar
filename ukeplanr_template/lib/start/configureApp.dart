import 'package:ukeplanr_template/start/localization/configureLocalization.dart';
import 'package:ukeplanr_template/start/navigation/configureNavigation.dart';
import 'package:ukeplanr_template/start/navigation/routes/configureRoutes.dart';
import 'package:ukeplanr_template/start/widgets/configureInitialization.dart';
import 'package:ukeplanr_template/start/logs/configerLogger.dart';
import 'package:ukeplanr_template/start/theme/configureTheme.dart';

configureApp() {
  configureLogger();
  configureLocalization();
  configureNavigationWatcher();
  configureRoutes();
  configureInitialization();
  configureThemes();
}
