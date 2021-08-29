import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/theme/custom/customTextTheme.dart';

extension ToTextTheme on CustomTextTheme {
  TextTheme toTextTheme() {
    return new TextTheme(
      bodyText1: this.bodyText1.value,
      bodyText2: this.bodyText2.value,
      button: this.button.value,
      caption: this.caption.value,
      headline1: this.headline1.value,
      headline2: this.headline2.value,
      headline3: this.headline3.value,
      headline4: this.headline4.value,
      headline5: this.headline5.value,
      headline6: this.headline6.value,
      overline: this.overline.value,
      subtitle1: this.subtitle1.value,
      subtitle2: this.subtitle2.value,
    );
  }
}
