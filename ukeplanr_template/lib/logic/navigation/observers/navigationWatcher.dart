import 'package:flutter/material.dart';

class NavigationWatcher extends NavigatorObserver {
  // todo implement custom tracking feature for pages

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print("ok so something replaced");
  }
}
