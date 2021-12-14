import 'package:flutter/material.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_color_scheme.dart';

extension ToColorScheme on CustomColorScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      background: background.value,
      brightness: brightness.value,
      error: error.value,
      onBackground: onBackground.value,
      onError: onError.value,
      onPrimary: onPrimary.value,
      onSecondary: onSecondary.value,
      onSurface: onSurface.value,
      primary: primary.value,
      primaryVariant: primaryVariant.value,
      secondary: secondary.value,
      secondaryVariant: secondaryVariant.value,
      surface: surface.value,
    );
  }
}
