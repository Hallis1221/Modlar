import 'package:ukeplanr_template/extensions/color/asHex.dart';

import 'package:flutter/material.dart';

extension ConvertToMap on ThemeData {
  Map<String, String> toMap() {
    return {
      "backgroundColor": this.backgroundColor.toHex(),
      "buttonColor": this.buttonColor.toHex()
    };
  }
}
