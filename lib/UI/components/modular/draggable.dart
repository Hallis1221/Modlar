// TODO tidy up and implement log

// TODO this could just return a list of children

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
  Column createColumn(List<Widget> widgets) {
    List<Widget> children = <Widget>[];
    int index = 0;
    if (widgets.isNotEmpty) {
      for (Widget widget in widgets) {
        children.add(
          DraggableDragtarget(
            child: widget,
            dragController: DragController(
              id: index,
            ),
          ),
        );
        index++;
      }
    }

    return Column(
      children: children,
    );
  }

  Row createRow(List<Widget> widgets) {
    List<Widget> children = <Widget>[];
    int index = 0;
    if (widgets.isNotEmpty) {
      for (Widget widget in widgets) {
        children.add(
          DraggableDragtarget(
            child: widget,
            dragController: DragController(
              id: index,
            ),
          ),
        );
        index++;
      }
    }

    return Row(
      children: children,
    );
  }

  Stack createStack(List<Widget> widgets) {
    List<Widget> children = <Widget>[];
    int index = 0;
    if (widgets.isNotEmpty) {
      for (Widget widget in widgets) {
        children.add(
          DraggableDragtarget(
            child: widget,
            dragController: DragController(
              id: index,
            ),
          ),
        );
        index++;
      }
    }

    return Stack(
      children: children,
    );
  }

  // switch based on type
  switch (type) {
    case Column:
      return createColumn(widgets);
    case Row:
      print(createRow(widgets).children);
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

  DragController({required this.id});
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
