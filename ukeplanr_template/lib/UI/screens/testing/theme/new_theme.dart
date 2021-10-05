import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_theme.dart';
import 'package:ukeplanr_template/UI/components/theme/color_picker.dart';
import 'package:ukeplanr_template/extensions/customColorScheme/to_color_scheme.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class ThemeCreator extends StatelessWidget {
  const ThemeCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BehaviorSubject<CustomTheme> customTheme =
        BehaviorSubject<CustomTheme>.seeded(
      CustomTheme(
        theme: BehaviorSubject<ThemeData>.seeded(Theme.of(context)),
        themeName: GetIt.instance
            .get<ThemesService>()
            .currentCustomTheme
            .value!
            .themeName,
      ),
    );
    TextEditingController nameController = TextEditingController(
        text: GetIt.instance
            .get<ThemesService>()
            .currentCustomTheme
            .value!
            .themeName);
    return StreamBuilder<CustomTheme>(
      stream: customTheme.stream,
      builder: (_, AsyncSnapshot<CustomTheme> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return Scaffold(
            backgroundColor: snapshot.data!.backgroundColor.value,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        controller: nameController,
                      ),
                    ),
                    _ColorChanger(
                      color: snapshot.data!.backgroundColor,
                      title:
                          AppLocalizations.of(context)!.changeBackgroundColor,
                      onChange: (Color color) {
                        customTheme.value.backgroundColor.value = color;
                        customTheme.value = customTheme.value;
                      },
                    ),
                    _ColorChanger(
                      color: snapshot.data!.colorScheme.value.secondary,
                      onChange: (Color color) {
                        customTheme.value.colorScheme.value.secondary.value =
                            color;
                      },
                      title: AppLocalizations.of(context)!
                          .changeSecondaryVariantColor,
                    ),
                    _ColorChanger(
                      color: snapshot.data!.colorScheme.value.primary,
                      onChange: (Color color) {
                        customTheme.value.colorScheme.value.primary.value =
                            color;
                      },
                      title: AppLocalizations.of(context)!.changePrimaryColor,
                    ),
                    MaterialButton(
                      child: Text(
                        AppLocalizations.of(context)!.done,
                      ),
                      textColor: useWhiteForeground(
                              snapshot.data!.backgroundColor.value)
                          ? Colors.white
                          : Colors.black,
                      onPressed: () {
                        ThemesService themesServiceInstance =
                            GetIt.instance.get<ThemesService>();
                        themesServiceInstance.saveAndAddTheme(
                          CustomTheme(
                            theme: BehaviorSubject.seeded(
                              ThemeData(
                                backgroundColor:
                                    snapshot.data!.backgroundColor.value,
                                colorScheme: snapshot.data!.colorScheme.value
                                    .toColorScheme(),
                                textTheme: themesServiceInstance
                                    .currentCustomTheme
                                    .value!
                                    .theme
                                    .value!
                                    .textTheme,
                              ),
                            ),
                            themeName: nameController.text,
                          ),
                        );

                        themesServiceInstance
                            .setActiveTheme(nameController.text);
                      },
                    )
                  ],
                ),
                DropdownButton<String>(
                    value: snapshot.data!.themeName,
                    isDense: false,
                    onChanged: (String? value) {
                      customTheme.value.themeName = value.toString();
                      ThemeData? themeData =
                          GetIt.instance.get<ThemesService>().findTheme(value!);
                      nameController.text = value;
                      customTheme.value = CustomTheme(
                        theme: BehaviorSubject<ThemeData>.seeded(
                          ThemeData(
                            backgroundColor: themeData!.backgroundColor,
                            primaryColor: themeData.primaryColor,
                            colorScheme: themeData.colorScheme,
                          ),
                        ),
                        themeName: value,
                      );
                      customTheme = customTheme;
                    },
                    items: <DropdownMenuItem<String>>[
                      for (String? themeName in GetIt.instance
                          .get<ThemesService>()
                          .themes
                          .keys
                          .toSet()
                          .toList())
                        DropdownMenuItem<String>(
                            value: themeName.toString(),
                            child: Text(themeName.toString())),
                    ]),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _ColorChanger extends StatelessWidget {
  const _ColorChanger({
    required this.color,
    required this.onChange,
    required this.title,
    Key? key,
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
            snapshot.connectionState == ConnectionState.done) {
          return ThemeColorPicker(
            // for some reason this thinks snapshot.data gives color?. therefor we reconstruct the color
            currentColor: Color.fromARGB(
              snapshot.data!.alpha,
              snapshot.data!.red,
              snapshot.data!.green,
              snapshot.data!.blue,
            ),
            title: title,
            onChange: onChange,
          );
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }
}
