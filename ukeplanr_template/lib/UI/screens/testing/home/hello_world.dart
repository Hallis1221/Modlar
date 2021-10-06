import 'package:ukeplanr_template/UI/screens/testing/arguments/arguments/arguments.dart';
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
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.currentLocale,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ChangeLocale(
              newLocale: Localizations.localeOf(context).languageCode == "en"
                  ? const Locale("no", "NB")
                  : const Locale("en", "US"),
            ),
            ElevatedButton(
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(
                  context,
                  "/test",
                  arguments: ExtractArguments(
                    title: 'Extract Arguments Screen',
                  ),
                );
              },
              child: const Text('Navigate to screen that extracts arguments'),
            ),
          ],
        ),
      ),
    );
  }
}
