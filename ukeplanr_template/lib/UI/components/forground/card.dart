import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Theme.of(context).accentColor,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Card with circular border',
                textScaleFactor: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
