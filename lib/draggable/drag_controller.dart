import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:modlar/draggable/drag_data.dart';
import 'package:modlar/logic/logs/printer/log_service.dart';
import 'package:rxdart/rxdart.dart';

class DragController {
  final BehaviorSubject<DragData?> _subject =
      BehaviorSubject<DragData?>.seeded(null);

  Stream<DragData?> get stream => _subject.stream;

  // Get the latest value from the stream
  DragData? get value => _subject.value;

  // set widget
  void setWidget(Widget widget) {
    GetIt.instance.get<LogsService>().logger!.log(Level.info, "Set widget");

    _subject.value = DragData(widget: widget, controller: this);
  }
}
