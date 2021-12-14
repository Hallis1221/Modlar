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
          dragController: DragController(),
          child: Text("Drag me!"),
        ),
        DraggableDragtarget(
          dragController: DragController(),
          child: Text("Drag here!"),
        ),
        DraggableDragtarget(
          dragController: DragController(),
          child: Text("Drag something here!"),
        ),
      ],
    );
  }
}

class DragController {
  final BehaviorSubject<DragData?> _subject =
      BehaviorSubject<DragData?>.seeded(null);

  Stream<DragData?> get stream => _subject.stream;

  // set widget
  void setWidget(Widget widget) {
    if (_subject.value == null) {
      _subject.value = DragData(widget: widget, controller: this);
    } else {
      _subject.value!.widget = Draggable<Widget>(
        child: widget,
        feedback: widget,
        data: widget,
      );
    }
  }

  void setData(DragData data) {
    _subject.value = data;
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
            dragController.setData(data);
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
