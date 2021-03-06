import 'package:modlar/logic/localization/state/locale.dart';
import 'package:modlar/logic/logs/printer/log_service.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class ChangeLocale extends StatelessWidget {
  const ChangeLocale({
    required this.newLocale,
    Key? key,
  }) : super(key: key);

  final Locale newLocale;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).colorScheme.secondaryVariant,
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
