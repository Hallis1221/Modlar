import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

class LogSession extends LogOutput {
  BehaviorSubject<List<String>> _sessionLogs = BehaviorSubject.seeded([]);

  List<String> get getSessionLog => _sessionLogs.value;

  addLogToSession(String log) => _sessionLogs.value.add(log);

  @override
  void output(OutputEvent event) {
    String log = "";

    for (var line in event.lines) {
      print(line);
      log += "$line \n";
    }
    GetIt.instance.get<LogSession>().addLogToSession(log);
  }

  LogSession();
}
