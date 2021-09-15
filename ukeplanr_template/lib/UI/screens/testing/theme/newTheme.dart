import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
    // ignore: close_sinks
    BehaviorSubject<CustomTheme> customTheme = BehaviorSubject.seeded(
        new CustomTheme(
            theme: Theme.of(context),
            themeName: GetIt.instance.get<ThemesService>().currentThemeName));
    TextEditingController nameController = TextEditingController(
        text: GetIt.instance.get<ThemesService>().currentThemeName);
    return StreamBuilder<CustomTheme>(
        stream: customTheme.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active)
            return Scaffold(
              backgroundColor: snapshot.data!.backgroundColor.value,
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: TextField(
                            controller: nameController,
                          ),
                        ),
                        _ColorChanger(
                          color: snapshot.data!.backgroundColor,
                          title: AppLocalizations.of(context)!
                              .changeBackgroundColor,
                          onChange: (Color color) {
                            customTheme.value.backgroundColor.value = color;
                            customTheme.value = customTheme.value;
                          },
                        ),
                        _ColorChanger(
                          color: snapshot.data!.buttonColor,
                          onChange: (Color color) {
                            customTheme.value.buttonColor.value = color;
                          },
                          title:
                              AppLocalizations.of(context)!.changeButtonColor,
                        ),
                        _ColorChanger(
                          color: snapshot.data!.primaryColor,
                          onChange: (Color color) {
                            customTheme.value.primaryColor.value = color;
                          },
                          title:
                              AppLocalizations.of(context)!.changeButtonColor,
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

                            themesServiceInstance.addTheme(
                                ThemeData(
                                    backgroundColor:
                                        snapshot.data!.backgroundColor.value,
                                    buttonColor:
                                        snapshot.data!.buttonColor.value,
                                    textTheme: themesServiceInstance
                                        .currentTheme.value!.textTheme
                                    // !! TODO throws exception
                                    ),
                                nameController.text);
                            themesServiceInstance
                                .saveAndSetTheme(nameController.text);
                          },
                        )
                      ],
                    ),
                  ),
                  DropdownButton(
                      value: snapshot.data!.themeName,
                      isDense: false,
                      onChanged: (String? value) {
                        customTheme.value.themeName = value.toString();
                        ThemeData? themeData = GetIt.instance
                            .get<ThemesService>()
                            .findTheme(value!);
                        nameController.text = value;
                        customTheme.value = CustomTheme(
                          theme: ThemeData(
                            backgroundColor: themeData!.backgroundColor,
                            buttonColor: themeData.buttonColor,
                            primaryColor: themeData.primaryColor,
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
                          DropdownMenuItem(
                              value: themeName.toString(),
                              child: Text(themeName.toString())),
                      ]),
                ],
              ),
            );
          else
            return Container();
        });
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
