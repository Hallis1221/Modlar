import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

class LogSession extends LogOutput {
  final BehaviorSubject<List<String>> _sessionLogs =
      BehaviorSubject<List<String>>.seeded(
    <String>[],
  );
  final BehaviorSubject<List<OutputEvent>> _sessionLogEvents =
      BehaviorSubject<List<OutputEvent>>.seeded(
    <OutputEvent>[],
  );

  List<String> get getSessionLog => _sessionLogs.value;
  List<OutputEvent> get getSessionsLogEvents => _sessionLogEvents.value;

  Stream<List<OutputEvent>> get eventsStream$ => _sessionLogEvents.stream;

  void addLogToSession(String log) => _sessionLogs.value.add(log);
  void addLogLineToSession(OutputEvent event) =>
      _sessionLogEvents.value.add(event);

  @override
  void output(OutputEvent event) {
    String log = "";

    for (String line in event.lines) {
      print(line);
      log += "$line \n";
    }
    if (event.level.index >= 3) {
      // TODO add crashlytics here
    }
    GetIt.instance.get<LogSession>().addLogLineToSession(event);
    GetIt.instance.get<LogSession>().addLogToSession(log);
  }

  LogSession();
}
