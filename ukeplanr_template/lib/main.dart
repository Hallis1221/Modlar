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
    // Get theme from the themes service
    final ThemeData? theme = GetIt.instance<ThemesService>().getTheme;
    return MaterialApp(
      theme: theme,
      home: PlaceholderWidget(),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
    );
  }
}
