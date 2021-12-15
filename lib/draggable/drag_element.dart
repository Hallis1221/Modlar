import 'package:modlar/UI/components/modular/draggable_drag_target.dart';
import 'package:flutter/material.dart';
import 'package:modlar/draggable/drag_controller.dart';

class DragElement {
  // Create list over non-draggable widgets / the widgets that are parsed as arguments
  final List<Widget> nonDraggableWidgets;

  // Create list over draggable widgets that are gotten from parsing the non draggable widgets
  List<Widget> get draggableWidgets => _createDraggableWidgetList();

  final String pageID;
  final String elementID;

  // Replace : with . to not confuse the seperator with page/element ID
  late final String elementUID =
      "${pageID.replaceAll(':', '.')}:${elementID.replaceAll(':', '.')}";

  // It is local beacuse the elements are not prefixed with the elementUID and
  // thus should not be used outside the current instance of the class
  // ignore: prefer_final_fields
  Map<String, DragController> _dragControllers = <String, DragController>{};

  // Register drag controller
  void registerDragController(DragController dragController) =>
      _dragControllers["${dragController.dragControllerIndex}"] =
          dragController;

  // Returns a [bool] if the given ID is registered as a drag controller.
  // It is not registered with the elementUID beacuse that is given as every element
  // in dragControllers could be prefixed with the elementUID

  bool isDragControllerRegistered(String dragControllerID) =>
      _dragControllers.containsKey(dragControllerID);

  // Convert  list of non-draggable widgets to a list of draggable widgets
  List<Widget> _createDraggableWidgetList() {
    // We need to start at -1 beacuse we can not increment after creating a widget,
    // thus if we want to have a widget at index 0 we need to instantiate it at index -1
    int _index = -1;
    return nonDraggableWidgets.map((
      Widget widget,
    ) {
      _index++;

      return DraggableDragtarget(
        child: widget,
        dragController: DragController(
          dragElement: this,
          dragControllerIndex: _index,
        ),
      );
    }).toList();
  }
  // Create function that returns a list of draggable widgets and saves it to a list

  DragElement(
      {required this.nonDraggableWidgets,
      required this.pageID,
      required this.elementID});
}
