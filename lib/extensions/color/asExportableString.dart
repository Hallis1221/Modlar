import 'package:flutter/material.dart';

extension ColorAsHex on Color {
  String toExportableString() {
    return int.parse(this.toString().split('(0x')[1].split(')')[0], radix: 16)
        .toString();
  }
}
