import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ukeplanr_template/logic/navigation/observers/navigationWatcher.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          onPressed: () =>
              print(GetIt.instance<NavigationWatcher>().getRouteHistory),
          child: Text(
            "Page not found",
          ),
        ),
      ),
    );
  }
}
