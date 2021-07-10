import 'package:ukeplanr_template/components/temp/errors/404.dart';
import 'package:ukeplanr_template/logic/routes/routes.dart';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

Widget findWidgetFromRoute({
  @required RouteSettings? settings,
}) {
  Widget? nullableWidget =
      GetIt.instance<RoutesService>().getRoutes![settings!.name];
  Widget widget = nullableWidget != null ? nullableWidget : PageNotFound();
  return widget;
}
