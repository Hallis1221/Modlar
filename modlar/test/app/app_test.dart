import 'package:flutter_test/flutter_test.dart';
import 'package:modlar/main.dart';
import 'package:modlar/start/configure_app.dart';

void main() => group("Start app:", () {
      test(
        "Configure App",
        () async => await configureApp(),
      );
      testWidgets("Build app", (WidgetTester widgetTester) async {
        await configureApp();
        await widgetTester.pumpWidget(
          const MyApp(),
        );
      });
    });
