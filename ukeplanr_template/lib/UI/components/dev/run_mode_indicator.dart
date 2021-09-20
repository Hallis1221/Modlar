import 'package:ukeplanr_template/UI/components/about/about_dialog.dart';
import 'package:ukeplanr_template/logic/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
      child: GestureDetector(
        onTap: () => showFilledOutAboutDialog(context, mode),
        child: Container(
          // For some reason gestureDetector does not work without a color
          color: GetIt.instance.get<ThemesService>().debugColor,
          padding: const EdgeInsets.only(top: 55, right: 50),
          child: Banner(
            message: mode.toUpperCase(),
            location: BannerLocation.bottomStart,
          ),
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
