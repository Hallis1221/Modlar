import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/Localization/app_localizations.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: SelectableText(
          AppLocalizations.of(context)!.helloWorld,
        ),
      ),
    );
  }
}
