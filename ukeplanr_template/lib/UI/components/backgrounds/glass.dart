import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBackground extends StatelessWidget {
  const GlassBackground({
    Key? key,
    required this.backgroundChild,
    required this.child,
    this.blur = 0.1,
    this.height,
    this.width,
  }) : super(key: key);
  final Widget child;
  final double? height;
  final double? width;
  final double blur;
  final Widget backgroundChild;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundChild,
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(
                    0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        child
      ],
    );
  }
}
