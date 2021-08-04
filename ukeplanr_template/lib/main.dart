import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/logic/navigation/gen/generateRoute.dart';
import 'package:ukeplanr_template/logic/navigation/observers/navigationWatcher.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';
import 'package:ukeplanr_template/start/configureApp.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

main() {
  // Call configure app to setup/start all the required services before starting
  // to paint on the screen. configureApp() is imported from start/configureApp.dart
  configureApp();
  // Runapp runs the given widget as our main app. The widget referenced here
  // should contain a root widget (like cupertinoapp, materialapp, etc)
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In order to change the Locale at run time we needto rebuild the entire
    // app to use the new locale. Since we use rxdart behaviorsubjects to manage
    // state, we have to use a stream that keeps track of that stream and rebuilds
    // the app once the locale has changed.
    return StreamBuilder<Locale?>(
      // Get LocaleName class and acsess the stream on it.
      stream: GetIt.instance.get<LocaleName>().stream$,
      // Not naming it context and snapshot beacuse we have two streams. Also
      // declare type for clarity.
      builder:
          (BuildContext localeContext, AsyncSnapshot<Locale?> localeSnapshot) {
        return StreamBuilder<ThemeData?>(
          stream: GetIt.instance.get<ThemesService>().currentTheme.stream,
          builder: (themeContext, themeSnapshot) {
            return MaterialApp(
              // Get theme from the themes service. ThemesService.getTheme give us
              // whatever theme is compatible with its criterias (which could include
              // stuff like system preference, settings, etc). Calls it directly
              // in the argument to avoid having logic code in the build method/avoid
              // storing variables in the buld method. We want to avoid this beacuse build
              // is primarily a painting function, and the code looks *cleaner* when not
              // storing stuff inside of it.
              theme: themeSnapshot.data,

              initialRoute: "/",
              // Same principle as with the theme. Passes it directly as it isent too
              // long nor complicated.
              navigatorObservers: [
                GetIt.instance<NavigationWatcher>(),
              ],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: [
                Locale('en', ''),
                Locale('no', 'NB'),
              ],

              locale: localeSnapshot.data,
              onGenerateRoute: (settings) => generateRoute(settings),
            );
          },
        );
      },
    );
  }
}
