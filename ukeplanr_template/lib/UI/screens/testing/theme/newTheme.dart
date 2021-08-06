import 'package:flutter/services.dart';
import 'package:ukeplanr_template/logic/theme/custom/customTextTheme.dart';
import 'package:ukeplanr_template/logic/theme/custom/customTheme.dart';
import 'package:ukeplanr_template/UI/components/theme/colorPicker.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';
import 'package:ukeplanr_template/extensions/textStyle/setSize.dart';
import 'package:ukeplanr_template/extensions/customTextTheme/toTextTheme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class ThemeCreator extends StatelessWidget {
  const ThemeCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTheme customTheme = new CustomTheme(context: context);
    return Scaffold(
      body: Container(
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
            _TextChanger(
              textTheme: customTheme.textTheme,
            ),
            MaterialButton(
              child: Text("Done"),
              onPressed: () {
                print(customTheme.textTheme.value.bodyText1.toString());
                ThemesService themesServiceInstance =
                    GetIt.instance.get<ThemesService>();
                themesServiceInstance.addTheme(
                    ThemeData(
                        backgroundColor: customTheme.backgroundColor.value,
                        buttonColor: customTheme.buttonColor.value,
                        // !! TODO throws exception
                        textTheme: new TextTheme(
                            bodyText1:
                                customTheme.textTheme.value.bodyText1.value)),
                    "custom");
                themesServiceInstance.saveAndSetTheme("custom");
              },
            )
          ],
        ),
      ),
    );
  }
}

// TODO make a text changer for changin textstyles
class _TextChanger extends StatelessWidget {
  const _TextChanger({
    Key? key,
    required this.textTheme,
  }) : super(key: key);
  final BehaviorSubject<CustomTextTheme> textTheme;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Row(
        children: [
          StreamBuilder<TextStyle?>(
              stream: textTheme.value.bodyText1.stream,
              builder: (context, snapshot) {
                return Container(
                  height: 100,
                  width: 100,
                  child: new TextField(
                    decoration: new InputDecoration(
                        labelText: "Size", labelStyle: snapshot.data),
                    keyboardType: TextInputType.number,

                    onChanged: (value) {
                      textTheme.value.bodyText1.value = textTheme
                          .value.bodyText1.value
                          .setSize(int.parse(value));
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (int.parse(newValue.text) >= 144) {
                          return oldValue;
                        } else {
                          return newValue;
                        }
                      })
                    ], // Only numbers can be entered
                  ),
                );
              }),
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
