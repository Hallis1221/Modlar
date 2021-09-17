import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';

class ThemeColorPicker extends StatelessWidget {
  const ThemeColorPicker({
    Key? key,
    required this.currentColor,
    required this.title,
    required this.onChange,
  }) : super(key: key);

  final Color currentColor;
  final String title;
  final Function(Color color) onChange;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 3.0,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: const EdgeInsets.all(0.0),
              contentPadding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              content: SingleChildScrollView(
                child: SlidePicker(
                  pickerColor: currentColor,
                  onColorChanged: onChange,
                  paletteType: PaletteType.rgb,
                  enableAlpha: false,
                  displayThumbColor: true,
                  showLabel: false,
                  showIndicator: true,
                  indicatorBorderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Text(title),
      color: currentColor,
      textColor: useWhiteForeground(currentColor) ? Colors.white : Colors.black,
    );
  }
}
