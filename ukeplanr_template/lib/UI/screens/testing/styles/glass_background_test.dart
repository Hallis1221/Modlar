import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glassed_color.dart';
import 'package:ukeplanr_template/UI/components/forground/card.dart';
import 'package:ukeplanr_template/UI/components/off-center/off_center_circle.dart';
import 'package:ukeplanr_template/logic/animation/background.dart';

class GlassBackgroundPage extends StatelessWidget {
  const GlassBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassedColor(
        child: MaterialButton(
            onPressed: () {
              BackgroundColorAnimation backgroundColorAnimationInstance =
                  GetIt.instance.get<BackgroundColorAnimation>();
              if (backgroundColorAnimationInstance.getVarOne == 0) {
                backgroundColorAnimationInstance.setVarOne(1);
              } else {
                backgroundColorAnimationInstance.setVarOne(0);
              }
            },
            child: const ClassCard()),
        colors: <Widget>[
          StreamBuilder<num>(
              stream: GetIt.instance.get<BackgroundColorAnimation>().stream$,
              builder: (_, AsyncSnapshot<num> snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const OffCenterCircle(
                    color: Colors.orange,
                    alignment: Alignment(-1.5, 1.5),
                  );
                }

                return OffCenterCircle(
                  duration: const Duration(seconds: 5),
                  color: snapshot.requireData >= 1 ? Colors.black : Colors.red,
                  alignment: Alignment(-1.5 * snapshot.requireData, 1.5),
                );
              }),
          OffCenterCircle(
            color: Theme.of(context).primaryColor,
            alignment: const Alignment(1, -1.5),
          )
        ],
      ),
    );
  }
}
