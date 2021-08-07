import 'package:get_it/get_it.dart';
import 'package:ukeplanr_template/UI/components/locale/changeLocale.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/Localization/state/locale.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context).toString());
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                AppLocalizations.of(context)!.helloWorld,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              ChangeLocale(
                newLocale: Localizations.localeOf(context).toString() == "en_"
                    ? Locale("no", "NB")
                    : Locale("en", "US"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
