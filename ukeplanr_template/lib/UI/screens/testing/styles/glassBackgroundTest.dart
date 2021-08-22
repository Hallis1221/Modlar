import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glass.dart';

class GlassBackgroundPage extends StatelessWidget {
  const GlassBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GlassBackground(
          backgroundChild: Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 12.0,
                  sigmaY: 12.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(
                      0.5,
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
