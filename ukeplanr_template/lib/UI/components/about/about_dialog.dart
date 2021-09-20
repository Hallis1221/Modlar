import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';

void showFilledOutAboutDialog(BuildContext context, String mode) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return showAboutDialog(
    context: context,
    routeSettings: ModalRoute.of(context)!.settings,
    applicationName: packageInfo.appName,
    applicationLegalese: packageInfo.buildSignature,
    applicationVersion: packageInfo.version,
    applicationIcon: Image.asset(
      "assets/images/ukeplanr.png",
      width: 50,
      height: 50,
    ),
    children: <Widget>[
      Text(
        AppLocalizations.of(context)!.runningMode.replaceAll(
              "!MODE!",
              mode,
            ),
      ),
    ],
  );
}
