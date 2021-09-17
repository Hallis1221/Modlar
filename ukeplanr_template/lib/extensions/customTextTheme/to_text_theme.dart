import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_text_theme.dart';

extension ToTextTheme on CustomTextTheme {
  TextTheme toTextTheme() {
    return TextTheme(
      bodyText1: bodyText1.value,
      bodyText2: bodyText2.value,
      button: button.value,
      caption: caption.value,
      headline1: headline1.value,
      headline2: headline2.value,
      headline3: headline3.value,
      headline4: headline4.value,
      headline5: headline5.value,
      headline6: headline6.value,
      overline: overline.value,
      subtitle1: subtitle1.value,
      subtitle2: subtitle2.value,
    );
  }
}
