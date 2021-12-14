// TODO tidy up and implement log

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class DraggableWidgetList extends StatelessWidget {
  const DraggableWidgetList(
      {required this.widgetList, required this.type, Key? key})
      : super(key: key);

  final List<Widget> widgetList;
  final Type type;

  @override
  Widget build(BuildContext context) {
    return createWidget(context: context, type: type, widgets: widgetList);
  }
}

Widget createWidget({
  required BuildContext context,
  required Type type,
  required List<Widget> widgets,
}) {
  Widget createColumn(List<Widget> widgets) {
    Column nullableColumn = Column();
    return Column();
  }

  Widget createRow(List<Widget> widgets) {
    return Row();
  }

  Widget createStack(List<Widget> widgets) {
    return Stack();
  }

  // switch based on type
  switch (type) {
    case Column:
      return createColumn(widgets);
    case Row:
      return createRow(widgets);
    case Stack:
      return createStack(widgets);
    default:
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ErrorWidget(
            "Draggable must be given a widgetcontainer of type row, column, or stack"),
      );
  }
}

class DragTest extends StatelessWidget {
  const DragTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DraggableDragtarget(
          dragController: DragController(1),
          child: Text("Drag me!"),
        ),
        DraggableDragtarget(
          dragController: DragController(2),
          child: Text("Drag here!"),
        ),
        DraggableDragtarget(
          dragController: DragController(3),
          child: Text("Drag something here!"),
        ),
      ],
    );
  }
}

class DragController {
  // debug purposes
  int id;

  final BehaviorSubject<DragData?> _subject =
      BehaviorSubject<DragData?>.seeded(null);

  Stream<DragData?> get stream => _subject.stream;

  // Get the latest value from the stream
  DragData? get value => _subject.value;

  // set widget
  void setWidget(Widget widget) {
    _subject.value = DragData(widget: widget, controller: this);
  }

  DragController(this.id);
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
            print(
                "Previous controller: ${data.controller.id}. Current controller: ${dragController.id}");
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
