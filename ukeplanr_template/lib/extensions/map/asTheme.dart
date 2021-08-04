import 'package:ukeplanr_template/extensions/color/asExportableString.dart';

import 'package:flutter/material.dart';

extension ConvertToTheme on Map {
  ThemeData toTheme() {
    return ThemeData(
      backgroundColor: Color(int.parse(this["backgroundColor"])),
      buttonColor: Color(int.parse(this["buttonColor"])),
    );
  }
}
