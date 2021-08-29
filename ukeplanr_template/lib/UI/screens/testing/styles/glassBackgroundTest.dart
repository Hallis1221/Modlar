import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ukeplanr_template/extensions/color/fromHex.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glass.dart';

class GlassBackgroundPage extends StatelessWidget {
  const GlassBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GlassBackground(
          blur: 120,
          backgroundChild: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                color: Colors.grey.shade200.withOpacity(
                  0.5,
                ),
              ),
              child: Stack(children: [
                Align(
                  alignment: Alignment(-1, 1.5),
                  child: Transform.scale(
                    // scale does not determine the size, it determines by how
                    // much to move in the x and y direction
                    scale: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(1.5, -1.5),
                  child: Transform.scale(
                    // scale does not determine the size, it determines by how
                    // much to move in the x and y direction
                    scale: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
