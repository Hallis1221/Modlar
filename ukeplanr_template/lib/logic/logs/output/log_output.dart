import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

class LogSession extends LogOutput {
  final BehaviorSubject<List<String>> _sessionLogs = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<OutputEvent>> _sessionLogEvents =
      BehaviorSubject.seeded([]);

  List<String> get getSessionLog => _sessionLogs.value;
  List<OutputEvent> get getSessionsLogEvents => _sessionLogEvents.value;

  Stream<List<OutputEvent>> get eventsStream$ => _sessionLogEvents.stream;

  void addLogToSession(String log) => _sessionLogs.value.add(log);
  void addLogLineToSession(OutputEvent event) =>
      _sessionLogEvents.value.add(event);

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
