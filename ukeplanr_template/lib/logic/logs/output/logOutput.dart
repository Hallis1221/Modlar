import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

class LogSession extends LogOutput {
  // ignore: close_sinks
  BehaviorSubject<List<String>> _sessionLogs = BehaviorSubject.seeded([]);
  // ignore: close_sinks
  BehaviorSubject<List<String>> _sessionLogLines = BehaviorSubject.seeded([]);

  List<String> get getSessionLog => _sessionLogs.value;
  List<String> get getSessionLogLines => _sessionLogLines.value;

  Stream<List<String>> get linesStream$ => _sessionLogLines.stream;

  addLogToSession(String log) => _sessionLogs.value.add(log);
  addLogLineToSession(String logLine) => _sessionLogLines.value.add(logLine);

  @override
  void output(OutputEvent event) {
    String log = "";

    for (var line in event.lines) {
      print(line);
      log += "$line \n";
      GetIt.instance.get<LogSession>().addLogLineToSession(log);
    }
    GetIt.instance.get<LogSession>().addLogToSession(log);
  }

  LogSession();
}
