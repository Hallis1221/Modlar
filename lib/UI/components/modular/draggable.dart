// TODO tidy up and implement log and refactor

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

List<Widget> createDraggableWidgetList({required List<Widget> widgets}) {
  return widgets.map((Widget widget) {
    return DraggableDragtarget(child: widget, dragController: DragController());
  }).toList();
}

class DragController {
  final BehaviorSubject<DragData?> _subject =
      BehaviorSubject<DragData?>.seeded(null);

  Stream<DragData?> get stream => _subject.stream;

  // Get the latest value from the stream
  DragData? get value => _subject.value;

  // set widget
  void setWidget(Widget widget) {
    _subject.value = DragData(widget: widget, controller: this);
  }
}

class DraggableDragtarget extends StatelessWidget {
  const DraggableDragtarget(
      {required this.child, required this.dragController, Key? key})
      : super(key: key);
  final Widget child;
  final DragController dragController;
  @override
  Widget build(BuildContext context) {
    Widget prevWidget = child;

    return StreamBuilder<DragData?>(
      stream: dragController.stream,
      builder: (_, AsyncSnapshot<DragData?> snapshot) {
        return DragTarget<DragData>(
          builder: (_, __, ___) {
            if (snapshot.data == null) {
              dragController.setWidget(prevWidget);
              return Container();
            }
            return Draggable<DragData>(
              child: snapshot.data!.widget,
              feedback: snapshot.data!.widget,
              data: snapshot.data,
            );
          },
          onAccept: (DragData data) {
            if (dragController.value == null) {
              print("NOOO");
            } else {
              data.controller.setWidget(dragController.value!.widget);
              dragController.setWidget(data.widget);
            }
          },
        );
      },
    );
  }
}

class DragData {
  Widget widget;
  DragController controller;

  DragData({required this.widget, required this.controller});
}
