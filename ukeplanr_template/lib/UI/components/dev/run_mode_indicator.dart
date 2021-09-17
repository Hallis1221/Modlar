import 'package:flutter/material.dart';

class RunModeBanner extends StatelessWidget {
  const RunModeBanner(
    this.mode, {
    Key? key,
  }) : super(key: key);

  final String mode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.only(top: 55, right: 50),
        child: Banner(
          message: mode,
          location: BannerLocation.bottomStart,
        ),
      ),
    );
  }
}

class Whatever extends StatelessWidget {
  const Whatever({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
