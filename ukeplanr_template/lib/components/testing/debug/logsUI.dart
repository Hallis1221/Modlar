//TODO currently the characters isnt supported to display so it looks like gibberish.

import 'package:ukeplanr_template/logic/logs/printer/logService.dart';
import 'package:ukeplanr_template/extensions/list/RawListString.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DebugLogsUI extends StatelessWidget {
  const DebugLogsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SelectableText(
        GetIt.instance.get<LogsService>().getSession.getSessionLogLines.first,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
