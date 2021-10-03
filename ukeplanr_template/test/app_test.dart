import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukeplanr_template/UI/screens/testing/home/hello_world.dart';
import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/main.dart';
import 'package:ukeplanr_template/start/configure_app.dart';

// TODO seperate into different files and folders
void main() {
  group("Start the app", () {
    test(
      "Configure App",
      () async => await configureApp(),
    );
    testWidgets(
      "Build app",
      (WidgetTester widgetTester) async => await widgetTester.pumpWidget(
        const MyApp(),
      ),
    );
  });
  group("Testing app localization", () {
    LocaleName localeNameInstance = LocaleName();
    test('Load Localization', () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? storedLocale = prefs.getString("activeLocale");
      storedLocale ??= "en_US";
      List<String> localeStrings = storedLocale.split("_");
      await localeNameInstance.changeLocale(
        Locale(localeStrings[0], localeStrings[1]),
      );
    });
    testWidgets("Check localization on screen",
        (WidgetTester widgetTester) async {
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
