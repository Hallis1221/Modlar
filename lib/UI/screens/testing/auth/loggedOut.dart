import 'package:flutter/material.dart';

class LoggedOut extends StatelessWidget {
  const LoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          "You are not logged in",
        ),
      ),
    );
  }
}
