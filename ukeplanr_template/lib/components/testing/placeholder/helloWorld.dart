import 'package:ukeplanr_template/logic/Localization/app_localizations.dart';
import 'package:ukeplanr_template/logic/localization/state/locale.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';
import 'package:ukeplanr_template/extensions/list/RawListString.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            AppLocalizations.of(context)!.helloWorld,
          ),
          MaterialButton(
            color: Colors.pink,
            onPressed: () {
              try {
                GetIt.instance.get<LocaleName>().changeLocale(
                      Locale('en', ''),
                    );
              } catch (error) {
                final Function? log =
                    GetIt.instance.get<LogsService>().logger!.log;
                log!(Level.error, """
                    Tried to change the locale but the following error was encountered: $error
                    """);
              }
              print(
                GetIt.instance
                    .get<LogsService>()
                    .getSession
                    .getSessionLog
                    .RawString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
