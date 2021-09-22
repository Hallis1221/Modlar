import 'package:flutter/material.dart';

// This lint warning is false. You should not specify type on a extension
//ignore: always_specify_types
extension ConvertToColorScheme on Map {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: this["brightness"],
      background: this["background"],
      error: this["error"],
      onBackground: this["onBackground"],
      onError: this["onError"],
      onPrimary: this["onPrimary"],
      onSecondary: this["onSecondary"],
      onSurface: this["onSurface"],
      primary: this["primary"],
      primaryVariant: this["primaryVariant"],
      secondary: this["secondary"],
      secondaryVariant: this["secondaryVariant"],
      surface: this["surface"],
    );
  }
}
