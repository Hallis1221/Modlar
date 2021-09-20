import 'package:rxdart/rxdart.dart';

class BackgroundColorAnimation {
  final BehaviorSubject<double> _varone = BehaviorSubject<double>.seeded(0);

  double get getVarOne => _varone.value;
  Stream<double> get stream$ => _varone.stream;
  void setVarOne(double newVarOne) async => _varone.value = newVarOne;
}
