import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBackground extends StatelessWidget {
  const GlassBackground({
    Key? key,
    required this.backgroundChild,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);
  final Widget? child;
  final double? height;
  final double? width;
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
                  sigmaX: 20.0,
                  sigmaY: 20.0,
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
