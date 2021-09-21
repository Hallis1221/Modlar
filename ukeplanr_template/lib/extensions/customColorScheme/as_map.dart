import 'package:flutter/material.dart';
import '../color/as_exportable_string.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_color_scheme.dart';

extension ToMap on CustomColorScheme {
  Map toMap() {
    return {
      "background": background.value.toExportableString(),
      "error": error.value,
      "onBackground": onBackground.value,
      "onError": onError.value,
      "onPrimary": onPrimary.value,
      "onSecondary": onSecondary.value,
      "onSurface": onSurface.value,
      "primary": primary.value,
      "primaryVariant": primaryVariant.value,
      "secondary": secondary.value,
      "secondaryVariant": secondaryVariant.value,
      "surface": surface.value,
    };
  }
}
