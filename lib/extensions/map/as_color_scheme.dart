import 'package:flutter/material.dart';

// This lint warning is false. You should not specify type on a extension
//ignore: always_specify_types
extension ConvertToColorScheme on Map {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: Brightness.values.first,
      background: Color(int.parse(this["background"])),
      error: Color(int.parse(this["error"])),
      onBackground: Color(int.parse(this["onBackground"])),
      onError: Color(int.parse(this["onError"])),
      onPrimary: Color(int.parse(this["onPrimary"])),
      onSecondary: Color(int.parse(this["onSecondary"])),
      onSurface: Color(int.parse(this["onSurface"])),
      primary: Color(int.parse(this["primary"])),
      primaryVariant: Color(int.parse(this["primaryVariant"])),
      secondary: Color(int.parse(this["secondary"])),
      secondaryVariant: Color(int.parse(this["secondaryVariant"])),
      surface: Color(int.parse(this["surface"])),
    );
  }
}
