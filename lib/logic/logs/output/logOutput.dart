import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';
import 'package:ukeplanr_template/logic/logs/printer/logService.dart';

class LogSession extends LogOutput {
  // ignore: close_sinks
  BehaviorSubject<List<String>> _sessionLogs = BehaviorSubject.seeded([]);
  // ignore: close_sinks
  BehaviorSubject<List<OutputEvent>> _sessionLogEvents =
      BehaviorSubject.seeded([]);

  List<String> get getSessionLog => _sessionLogs.value;
  List<OutputEvent> get getSessionsLogEvents => _sessionLogEvents.value;

  Stream<List<OutputEvent>> get eventsStream$ => _sessionLogEvents.stream;

  addLogToSession(String log) => _sessionLogs.value.add(log);
  addLogLineToSession(OutputEvent event) => _sessionLogEvents.value.add(event);

  @override
  void output(OutputEvent event) {
    String log = "";

    for (var line in event.lines) {
      print(line);
      log += "$line \n";
    }
    GetIt.instance.get<LogSession>().addLogLineToSession(event);
    GetIt.instance.get<LogSession>().addLogToSession(log);
  }

  LogSession();
}
