import 'package:ukeplanr_template/extensions/color/asExportableString.dart';

import 'package:flutter/material.dart';

extension ConvertToMap on ThemeData {
  Map<String, String> toMap() {
    return {
      "backgroundColor": this.backgroundColor.toExportableString(),
      "buttonColor": this.buttonColor.toExportableString()
    };
  }
}
