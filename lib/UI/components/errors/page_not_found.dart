import 'package:modlar/logic/navigation/observers/navigation_watcher.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: MaterialButton(
          onPressed: () =>
              print(GetIt.instance<NavigationWatcher>().getRouteHistory),
          child: Text(
            AppLocalizations.of(context)!.pageNotFound,
          ),
        ),
      ),
    );
  }
}
