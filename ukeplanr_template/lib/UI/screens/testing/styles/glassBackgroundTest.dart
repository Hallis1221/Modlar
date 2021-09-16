import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ukeplanr_template/UI/components/backgrounds/glassedColor.dart';
import 'package:ukeplanr_template/UI/components/forground/card.dart';
import 'package:ukeplanr_template/UI/components/off-center/offCenterCircle.dart';
import 'package:ukeplanr_template/logic/animation/background.dart';

class GlassBackgroundPage extends StatelessWidget {
  const GlassBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GlassedColor(
        child: MaterialButton(
            onPressed: () {
              GetIt.instance.get<BackgroundColorAnimation>().setVarOne(15);
            },
            child: ClassCard()),
        colors: [
          StreamBuilder<num>(
              stream: GetIt.instance.get<BackgroundColorAnimation>().stream$,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return OffCenterCircle(
                    color: Colors.orange,
                    alignment: Alignment(-1.5, 1.5),
                  );
                }
                num thing = 1;
                Color clr = Colors.red;
                if (snapshot.requireData >= 10) {
                  thing = -1 * thing;
                  clr = Colors.black;
                }
                return Container(
                  child: OffCenterCircle(
                    duration: Duration(seconds: 5),
                    color:
                        snapshot.requireData >= 1 ? Colors.black : Colors.red,
                    alignment: Alignment(-1.5 * thing, 1.5),
                  ),
                );
              }),
          OffCenterCircle(
            color: Theme.of(context).primaryColor,
            alignment: Alignment(1, -1.5),
          )
        ],
      )),
    );
  }
}
