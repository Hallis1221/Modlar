import 'package:flutter/material.dart';
import 'package:modlar/draggable/drag_controller.dart';
import 'package:modlar/draggable/drag_element.dart';

class DragData {
  DragElement dragElement;
  Widget widget;
  DragController controller;

  DragData(
      {required this.widget,
      required this.controller,
      required this.dragElement});
}
