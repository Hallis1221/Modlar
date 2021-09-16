import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class ChangeLocale extends StatelessWidget {
  const ChangeLocale({
    Key? key,
    required this.newLocale,
  }) : super(key: key);

  final Locale newLocale;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).buttonColor,
      onLongPress: () => Navigator.of(context).pushNamed("/glass"),
      onPressed: () {
        final Function? log = GetIt.instance.get<LogsService>().logger!.log;

        try {
          GetIt.instance.get<LocaleName>().changeLocale(
                newLocale,
              );
        } catch (error) {
          log!(Level.error, """
              Tried to change the locale but the following error was encountered: $error
              """);
        }
      },
    );
  }
}
