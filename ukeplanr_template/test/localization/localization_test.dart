import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/UI/screens/testing/home/hello_world.dart';
import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ukeplanr_template/start/configure_app.dart';

// TODO seperate into different files and folders
void main() => group(
      "App localization:",
      () {
        LocaleName localeNameInstance = LocaleName();
        test('Load Localization', () async {
          // Ensure all the services gets registered inside of getIt before utilizing them
          await configureApp();

          // Load up local storage
          SharedPreferences prefs = await SharedPreferences.getInstance();

          // Get the last used locale if it exsits
          String? storedLocale = prefs.getString("activeLocale");

          // if storedLocale is null, set it to en_US
          storedLocale ??= "en_US";

          // Split the locale into a language and country code
          List<String> localeStrings = storedLocale.split("_");

          // change the locale into the one from local storage
          await localeNameInstance.changeLocale(
            Locale(localeStrings[0], localeStrings[1]),
          );
        });

        // Ensure that the app displayes the loaded localization correctly
        testWidgets(
          "Check localization on screen based on loaded localization",
          (WidgetTester widgetTester) async => await _localizedHomeScreenTest(
            widgetTester,
            localeNameInstance.getLocaleName,
          ),
        );

        // Ensure that the app displayes no_NB localization correctly
        testWidgets(
          "Check localization for no_NB",
          (WidgetTester widgetTester) async => await _localizedHomeScreenTest(
            widgetTester,
            "no_NB",
          ),
        );

        // Ensure that the app displayes en_US localization correctly
        testWidgets(
          "Check localization for en_US",
          (WidgetTester widgetTester) async => await _localizedHomeScreenTest(
            widgetTester,
            "en_US",
          ),
        );
      },
    );

Future<void> _localizedHomeScreenTest(
    WidgetTester widgetTester, String localeString) async {
  List<String> localeStrings = localeString.split("_");

  await widgetTester.pumpWidget(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: const <Locale>[
      Locale('en', 'US'),
      Locale('no', 'NB'),
    ],
    locale: Locale(localeStrings[0], localeStrings[1]),
    home: const PlaceholderWidget(),
  ));
  expect(find.text(localeString), findsOneWidget);
}
