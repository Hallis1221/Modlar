import 'package:ukeplanr_template/logic/logs/logService.dart';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

void configureInitialization() {
  final Function? log = GetIt.instance.get<LogsService>().logger!.log;
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {}
}
