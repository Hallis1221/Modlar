import 'package:flutter/material.dart';
import '../color/as_exportable_string.dart';

extension ToMap on ColorScheme {
  Map<String, String> toMap() {
    return {
      "background": background.toExportableString(),
      "error": error.toExportableString(),
      "onBackground": onBackground.toExportableString(),
      "onError": onError.toExportableString(),
      "onPrimary": onPrimary.toExportableString(),
      "onSecondary": onSecondary.toExportableString(),
      "onSurface": onSurface.toExportableString(),
      "primary": primary.toExportableString(),
      "primaryVariant": primaryVariant.toExportableString(),
      "secondary": secondary.toExportableString(),
      "secondaryVariant": secondaryVariant.toExportableString(),
      "surface": surface.toExportableString(),
    };
  }
}
