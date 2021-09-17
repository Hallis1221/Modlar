import 'package:ukeplanr_template/UI/components/locale/change_locale.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              AppLocalizations.of(context)!.helloWorld,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ChangeLocale(
              newLocale: Localizations.localeOf(context).toString() == "en_"
                  ? const Locale("no", "NB")
                  : const Locale("en", "US"),
            ),
          ],
        ),
      ),
    );
  }
}
