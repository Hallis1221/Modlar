import 'package:flutter/material.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glass.dart';

class GlassedColor extends StatelessWidget {
  const GlassedColor({
    Key? key,
    this.blur = 120,
    this.child,
    this.colors = const [],
    this.opacity = 0.5,
  }) : super(key: key);

  final double blur;
  final Widget? child;
  final List<Widget> colors;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      blur: blur,
      child: Container(
        child: child,
      ),
      backgroundChild: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(
              opacity,
            ),
          ),
          child: Stack(
            children: colors,
          ),
        ),
      ),
    );
  }
}