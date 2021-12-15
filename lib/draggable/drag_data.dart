import 'package:flutter/material.dart';
import 'package:modlar/UI/components/modular/draggable_drag_target.dart';

List<Widget> createDraggableWidgetList({required List<Widget> widgets}) {
  return widgets.map((Widget widget) {
    return DraggableDragtarget(child: widget, dragController: DragController());
  }).toList();
}

class DragData {
  Widget widget;
  DragController controller;

  DragData({required this.widget, required this.controller});
}
