import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:modlar/draggable/drag_controller.dart';
import 'package:modlar/draggable/drag_data.dart';
import 'package:modlar/logic/logs/printer/log_service.dart';

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
              GetIt.instance
                  .get<LogsService>()
                  .logger!
                  .log(Level.error, "Dragcontroller value was null");
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
