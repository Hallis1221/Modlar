import 'package:flutter_test/flutter_test.dart';
import 'package:ukeplanr_template/main.dart';
import 'package:ukeplanr_template/start/configure_app.dart';

void main() => group("Start app:", () {
      test(
        "Configure App",
        () async => await configureApp(),
      );
      testWidgets("Build app", (WidgetTester widgetTester) async {
        try {
          await widgetTester.pumpWidget(
            const MyApp(),
          );
        } catch (e) {
          await configureApp();
          await widgetTester.pumpWidget(
            const MyApp(),
          );
        }
      });
    });
