import 'package:ukeplanr_template/UI/components/dev/run_mode_indicator.dart';
import 'package:ukeplanr_template/logic/dev/mode.dart';
import 'package:ukeplanr_template/logic/navigation/routes/routes.dart';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

Widget findWidgetFromRoute({
  @required RouteSettings? settings,
}) {
  Widget? nullableWidget =
      GetIt.instance<RoutesService>().getRoutes[settings!.name];
  RunMode runMode = GetIt.instance<RunMode>();
  Widget widget =
      nullableWidget ?? GetIt.instance<RoutesService>().get404Widget;

  // if the app has a banner enabled, show it.
  if (runMode.showBanner) {
    return Stack(
      children: <Widget>[widget, RunModeBanner(runMode.runMode)],
    );
  }
  return widget;
}
