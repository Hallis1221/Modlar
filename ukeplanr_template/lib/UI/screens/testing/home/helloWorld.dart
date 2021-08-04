import 'package:ukeplanr_template/UI/components/locale/changeLocale.dart';
import 'package:ukeplanr_template/logic/Localization/app_localizations.dart';

import 'package:flutter/material.dart';

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
          ChangeLocale(
            newLocale: Locale('no', 'NB'),
          ),
        ],
      ),
    );
  }
}
