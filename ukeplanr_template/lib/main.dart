import 'package:ukeplanr_template/logic/Localization/app_localizations.dart';
import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/logic/navigation/gen/generateRoute.dart';
import 'package:ukeplanr_template/logic/navigation/observers/navigationWatcher.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';
import 'package:ukeplanr_template/start/configureApp.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

main() {
  // Call configure app to setup/start all the required services before starting
  //to paint on the screen. configureApp() is imported from start/configureApp.dart
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale?>(
        stream: GetIt.instance.get<LocaleName>().stream$,
        builder: (context, snapshot) {
          return MaterialApp(
            // Get theme from the themes service. ThemesService.getTheme give us
            // whatever theme is compatible with its criterias (which could include
            // stuff like system preference, settings, etc). Calls it directly
            // in the argument to avoid having logic code in the build method/avoid
            // storing variables in the buld method. We want to avoid this beacuse build
            // is primarily a painting function, and the code looks *cleaner* when not
            // storing stuff inside of it.
            theme: GetIt.instance<ThemesService>().findTheme("orange"),

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

            locale: snapshot.data,
            onGenerateRoute: (settings) => generateRoute(settings),
          );
        });
  }
}
