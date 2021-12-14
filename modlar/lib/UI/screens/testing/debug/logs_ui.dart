// TODO currently the characters isnt supported to display so it looks like gibberish.
//This is the relevant error:
//Could not find a set of Noto fonts to display all missing characters.
//Please add a font asset for the missing characters.
//See: https://flutter.dev/docs/cookbook/design/fonts

import 'package:modlar/logic/logs/printer/log_service.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modlar/logic/theme/themes.dart';

class DebugLogsUI extends StatelessWidget {
  const DebugLogsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GetIt.instance.get<ThemesService>().debugColor,
        child: SelectableText(
          GetIt.instance
              .get<LogsService>()
              .getSession
              .getSessionsLogEvents
              .first
              .lines
              .first,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
