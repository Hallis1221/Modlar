import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBackground extends StatelessWidget {
  const GlassBackground({
    Key? key,
    required this.backgroundChild,
    this.blur = 0.1,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);
  final Widget? child;
  final double? height;
  final double? width;
  final double blur;
  final Widget backgroundChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          backgroundChild,
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: this.blur,
                  sigmaY: this.blur,
                ),
                child: Container(
                  height: height,
                  width: width,
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(
                      0.5,
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
