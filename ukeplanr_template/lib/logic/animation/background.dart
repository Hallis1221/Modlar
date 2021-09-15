import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BackgroundColorAnimation {
  // ignore: close_sinks
  BehaviorSubject<double> _varone = BehaviorSubject.seeded(0);
  Stream<double> get stream$ => _varone.stream;
  setVarOne(double newVarOne) async {
    _varone.value = newVarOne;
  }
}
