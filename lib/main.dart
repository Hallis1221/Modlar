import 'package:modlar/logic/navigation/observers/navigation_watcher.dart';
import 'package:modlar/logic/localization/state/locale.dart';
import 'package:modlar/logic/navigation/routes/routes.dart';
import 'package:modlar/logic/theme/themes.dart';
import 'package:modlar/start/configure_app.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // Call configure app to setup/start all the required services before starting
  // to paint on the screen. configureApp() is imported from start/configureApp.dart
  await configureApp();
  // Runapp runs the given widget as our app. The widget referenced here
  // should contain a root widget (like cupertinoapp, materialapp, etc)
  runApp(const MyApp());
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
      // declare type for clarity.
      builder: (_, AsyncSnapshot<Locale?> localeSnapshot) {
        if (localeSnapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        return StreamBuilder<ThemeData?>(
            stream: GetIt.instance
                .get<ThemesService>()
                .currentCustomTheme
                .value!
                .theme
                .stream,
            builder: (_, AsyncSnapshot<ThemeData?> themeSnapshot) {
              if (themeSnapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }
              return MaterialApp(
                // Get theme from the themes service. ThemesService.getTheme give us
                // whatever theme is compatible with its criteria (which could include
                // stuff like system preference, settings, etc). Calls it directly
                // in the argument to avoid having logic code in the build method/avoid
                // storing variables in the build method. We want to avoid this because build
                // is primarily a painting function, and the code looks *cleaner* when not
                // storing stuff inside of it.
                theme: themeSnapshot.data!,

                initialRoute: "/",
                navigatorObservers: <NavigatorObserver>[
                  GetIt.instance<NavigationWatcher>(),
                ],
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: const <Locale>[
                  Locale('en', 'US'),
                  Locale('no', 'NB'),
                ],
                // Same principle as with the theme. Passes it directly as it isent too
                // long nor complicated
                locale: localeSnapshot.data,
                routes:
                    GetIt.instance.get<RoutesService>().materialPageRoutes(),
                onUnknownRoute: (_) => MaterialPageRoute<Widget>(
                  builder: (_) =>
                      GetIt.instance.get<RoutesService>().get404Widget,
                ),

                // we use a custom one
                debugShowCheckedModeBanner: false,
              );
            });
      },
    );
  }
}
