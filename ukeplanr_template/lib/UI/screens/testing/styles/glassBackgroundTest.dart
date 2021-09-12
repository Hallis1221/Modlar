import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glassedColor.dart';
import 'package:ukeplanr_template/UI/components/off-center/offCenterCircle.dart';
import 'package:ukeplanr_template/extensions/color/fromHex.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glass.dart';

class GlassBackgroundPage extends StatelessWidget {
  const GlassBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GlassedColor(
        colors: [
          OffCenterCircle(
            color: Colors.red,
            alignment: Alignment(-1.5, 1.5),
          ),
          OffCenterCircle(
            color: Colors.blue,
            alignment: Alignment(1, -1.5),
          )
        ],
      )),
    );
  }
}
