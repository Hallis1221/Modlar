import 'package:flutter/material.dart';

class OffCenterCircle extends StatelessWidget {
  const OffCenterCircle({
    required this.color,
    this.alignment = const Alignment(-1.5, 1.5),
    this.duration = const Duration(seconds: 0),
    this.sizeDivider = 3,
  });

  final Alignment alignment;
  final Color color;
  final double sizeDivider;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: this.duration,
      alignment: this.alignment,
      child: Transform.scale(
        // scale does not determine the size, it determines by how
        // much to move in the x and y direction
        scale: 5,
        child: AnimatedContainer(
          duration: this.duration,
          height: MediaQuery.of(context).size.height / this.sizeDivider,
          width: MediaQuery.of(context).size.width / this.sizeDivider,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.color,
          ),
        ),
      ),
    );
  }
}
