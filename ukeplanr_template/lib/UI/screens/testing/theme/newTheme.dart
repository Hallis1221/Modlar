import 'package:ukeplanr_template/logic/theme/custom/customTheme.dart';
import 'package:ukeplanr_template/UI/components/theme/colorPicker.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class ThemeCreator extends StatelessWidget {
  const ThemeCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTheme customTheme = new CustomTheme(
      backgroundColor:
          BehaviorSubject.seeded(Theme.of(context).backgroundColor),
      buttonColor: BehaviorSubject.seeded(
        Theme.of(context).buttonColor,
      ),
    );
    return Container(
      child: Column(
        children: [
          _ColorChanger(
            color: customTheme.backgroundColor,
            title: AppLocalizations.of(context)!.changeBackgroundColor,
            onChange: (Color color) {
              customTheme.backgroundColor.value = color;
            },
          ),
          _ColorChanger(
            color: customTheme.buttonColor,
            onChange: (Color color) {
              customTheme.buttonColor.value = color;
            },
            title: AppLocalizations.of(context)!.changeButtonColor,
          ),
          MaterialButton(
            child: Text("Done"),
            onPressed: () {
              GetIt.instance.get<ThemesService>().addTheme(
                  ThemeData(
                    backgroundColor: customTheme.backgroundColor.value,
                    buttonColor: customTheme.buttonColor.value,
                  ),
                  "custom");
              GetIt.instance.get<ThemesService>().setCurrentTheme("custom");
            },
          )
        ],
      ),
    );
  }
}

class _ColorChanger extends StatelessWidget {
  const _ColorChanger({
    Key? key,
    required this.color,
    required this.onChange,
    required this.title,
  }) : super(key: key);

  final BehaviorSubject<Color> color;
  final Function(Color color) onChange;
  final String title;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color>(
        stream: color.stream,
        builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done)
            return ThemeColorPicker(
              // for some reason this thinks snapshot.data gives color?. therefor we reconstruct the color
              currentColor: new Color.fromARGB(
                snapshot.data!.alpha,
                snapshot.data!.red,
                snapshot.data!.green,
                snapshot.data!.blue,
              ),
              title: title,
              onChange: onChange,
            );
          else
            return Container(
              color: Colors.red,
            );
        });
  }
}
