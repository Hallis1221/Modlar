import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ukeplanr_admin_dashboard/logic/theme/themes.dart';
import 'package:ukeplanr_admin_dashboard/start/configureApp.dart';

main() {
  configureApp();
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData? theme = GetIt.instance<Themes>().getTheme;
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
