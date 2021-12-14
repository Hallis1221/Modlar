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
      children: const [
        DraggableDragtarget(
          child: Text("Drag me!"),
        ),
        DraggableDragtarget(
          child: Text("Drag here!"),
        ),
        DraggableDragtarget(
          child: Text("Drag something here!"),
        ),
      ],
    );
  }
}

class DraggableData {
  final Widget child;
  final DragTargetController owner;

  DraggableData({required this.child, required this.owner});
}

class DragTargetController {
  final BehaviorSubject<DraggableData?> _subject =
      BehaviorSubject<DraggableData?>.seeded(null);

  Stream<DraggableData?> get stream => _subject.stream;

  // set widget
  void setWidget(Widget widget) {
    _subject.value = DraggableData(
      child: Draggable<Widget>(
        child: widget,
        feedback: widget,
        data: widget,
      ),
      owner: this,
    );
  }
}

class DraggableDragtarget extends StatelessWidget {
  const DraggableDragtarget({required this.child, Key? key}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Widget startwidget = child;

    DragTargetController dragController = DragTargetController();
    dragController.setWidget(startwidget);

    return StreamBuilder<DraggableData?>(
      stream: dragController.stream,
      builder: (_, AsyncSnapshot<DraggableData?> snapshot) {
        return DragTarget<DraggableData>(
          builder: (_, __, ___) {
            if (snapshot.data == null) {
              return Draggable<Widget>(
                child: child,
                feedback: child,
                data: child,
              );
            }
            return snapshot.data!.child;
          },
          onAccept: (DraggableData data) {
            print("HERYWEWEWEWQEWQE");
            dragController.setWidget(data.child);
          },
          onAcceptWithDetails: (DragTargetDetails<DraggableData> details) {
            print("wehwqehjwqjhe");
          },
        );
      },
    );
  }
}
