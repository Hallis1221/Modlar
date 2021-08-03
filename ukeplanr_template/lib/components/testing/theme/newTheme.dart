import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/Localization/app_localizations.dart';
import 'package:ukeplanr_template/logic/theme/custom/customTheme.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';

class ThemeCreator extends StatelessWidget {
  const ThemeCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTheme customTheme = new CustomTheme(
        backgroundColor:
            BehaviorSubject.seeded(Theme.of(context).backgroundColor));
    return Container(
      child: Column(
        children: [
          StreamBuilder<Color>(
              stream: customTheme.backgroundColor.stream,
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
                    title: AppLocalizations.of(context)!.changeBackgroundColor,
                    onChange: (Color color) {
                      customTheme.backgroundColor.value = color;
                    },
                  );
                else
                  return Container(
                    color: Colors.red,
                  );
              }),
          MaterialButton(
            child: Text("Done"),
            onPressed: () {
              GetIt.instance.get<ThemesService>().addTheme(
                  ThemeData(backgroundColor: customTheme.backgroundColor.value),
                  "custom");
              GetIt.instance.get<ThemesService>().setCurrentTheme("custom");
            },
          )
        ],
      ),
    );
  }
}

class ThemeColorPicker extends StatelessWidget {
  const ThemeColorPicker({
    Key? key,
    required this.currentColor,
    required this.title,
    required this.onChange,
  }) : super(key: key);

  final Color currentColor;
  final String title;
  final Function(Color color) onChange;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 3.0,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: const EdgeInsets.all(0.0),
              contentPadding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              content: SingleChildScrollView(
                child: SlidePicker(
                  pickerColor: currentColor,
                  onColorChanged: onChange,
                  paletteType: PaletteType.rgb,
                  enableAlpha: false,
                  displayThumbColor: true,
                  showLabel: false,
                  showIndicator: true,
                  indicatorBorderRadius: const BorderRadius.vertical(
                    top: const Radius.circular(25.0),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Text(title),
      color: currentColor,
      textColor: useWhiteForeground(currentColor)
          ? const Color(0xffffffff)
          : const Color(0xff000000),
    );
  }
}
