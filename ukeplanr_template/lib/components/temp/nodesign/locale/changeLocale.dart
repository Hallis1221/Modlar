import 'package:ukeplanr_template/logic/Localization/state/locale.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

class ChangeLocale extends StatelessWidget {
  const ChangeLocale({
    Key? key,
    required this.newLocale,
  }) : super(key: key);

  final Locale newLocale;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.pink,
      onPressed: () {
        try {
          GetIt.instance.get<LocaleName>().changeLocale(
                newLocale,
              );
        } catch (error) {
          final Function? log = GetIt.instance.get<LogsService>().logger!.log;
          log!(Level.error, """
              Tried to change the locale but the following error was encountered: $error
              """);
        }
      },
    );
  }
}
