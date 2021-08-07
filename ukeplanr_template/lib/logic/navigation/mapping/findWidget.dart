import 'package:ukeplanr_template/logic/navigation/routes/routes.dart';
import 'package:ukeplanr_template/UI/components/errors/404.dart';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

Widget findWidgetFromRoute({
  @required RouteSettings? settings,
}) {
  Widget? nullableWidget =
      GetIt.instance<RoutesService>().getRoutes[settings!.name];
  Widget widget = nullableWidget != null
      ? nullableWidget
      : GetIt.instance<RoutesService>().get404Widget;
  return widget;
}
