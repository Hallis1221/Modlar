import 'package:flutter/material.dart';
import '../color/as_exportable_string.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_color_scheme.dart';

extension ToMap on CustomColorScheme {
  Map<String, String> toMap() {
    return {
      "background": background.value.toExportableString(),
      "error": error.value.toExportableString(),
      "onBackground": onBackground.value.toExportableString(),
      "onError": onError.value.toExportableString(),
      "onPrimary": onPrimary.value.toExportableString(),
      "onSecondary": onSecondary.value.toExportableString(),
      "onSurface": onSurface.value.toExportableString(),
      "primary": primary.value.toExportableString(),
      "primaryVariant": primaryVariant.value.toExportableString(),
      "secondary": secondary.value.toExportableString(),
      "secondaryVariant": secondaryVariant.value.toExportableString(),
      "surface": surface.value.toExportableString(),
    };
  }
}