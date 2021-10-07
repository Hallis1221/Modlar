import 'package:flutter/material.dart';
import 'package:ukeplanr_template/UI/screens/testing/arguments/arguments/arguments.dart';

// A Widget that extracts the necessary arguments from
// the ModalRoute.

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExtractArguments args;
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    args = ModalRoute.of(context)!.settings.arguments as ExtractArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: const Center(
        child: Text("message"),
      ),
    );
  }
}
