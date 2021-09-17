import 'package:rxdart/rxdart.dart';

class BackgroundColorAnimation {
  // ignore: close_sinks
  final BehaviorSubject<double> _varone = BehaviorSubject.seeded(0);

  double get getVarOne => _varone.value;
  Stream<double> get stream$ => _varone.stream;
  void setVarOne(double newVarOne) async => _varone.value = newVarOne;
}
