import 'package:flutter/material.dart';

class OffCenterCircle extends StatelessWidget {
  const OffCenterCircle({
    Key? key,
    required this.color,
    this.alignment = const Alignment(-1.5, 1.5),
    this.duration = const Duration(seconds: 0),
    this.sizeDivider = 3,
  }) : super(key: key);

  final Alignment alignment;
  final Color color;
  final double sizeDivider;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: duration,
      alignment: alignment,
      child: Transform.scale(
        // scale does not determine the size, it determines by how
        // much to move in the x and y direction
        scale: 5,
        child: AnimatedContainer(
          duration: duration,
          height: MediaQuery.of(context).size.height / sizeDivider,
          width: MediaQuery.of(context).size.width / sizeDivider,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
