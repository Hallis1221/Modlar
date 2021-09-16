import 'package:flutter/material.dart';

class RunModeBanner extends StatelessWidget {
  const RunModeBanner(
    this.mode,
  );

  final String mode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.only(top: 55, right: 50),
        child: Banner(
          message: this.mode,
          location: BannerLocation.bottomStart,
        ),
      ),
    );
  }
}
