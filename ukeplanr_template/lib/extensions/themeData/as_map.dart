import 'package:ukeplanr_template/extensions/color/as_exportable_string.dart';

import 'package:flutter/material.dart';

extension ConvertToMap on ThemeData {
  Map<String, String> toMap() {
    return <String, String>{
      "scaffoldBackgroundColor": scaffoldBackgroundColor.toExportableString(),
      "dialogBackgroundColor": dialogBackgroundColor.toExportableString(),
      "toggleableActiveColor": toggleableActiveColor.toExportableString(),
      "unselectedWidgetColor": unselectedWidgetColor.toExportableString(),
      "secondaryHeaderColor": secondaryHeaderColor.toExportableString(),
      "primaryColorLight": primaryColorLight.toExportableString(),
      "bottomAppBarColor": bottomAppBarColor.toExportableString(),
      "selectedRowColor": selectedRowColor.toExportableString(),
      "primaryColorDark": primaryColorDark.toExportableString(),
      "backgroundColor": backgroundColor.toExportableString(),
      "highlightColor": highlightColor.toExportableString(),
      "indicatorColor": indicatorColor.toExportableString(),
      "disabledColor": disabledColor.toExportableString(),
      "dividerColor": dividerColor.toExportableString(),
      "primaryColor": primaryColor.toExportableString(),
      "shadowColor": shadowColor.toExportableString(),
      "splashColor": splashColor.toExportableString(),
      "canvasColor": canvasColor.toExportableString(),
      "errorColor": errorColor.toExportableString(),
      "focusColor": focusColor.toExportableString(),
      "hoverColor": hoverColor.toExportableString(),
      "hintColor": hintColor.toExportableString(),
      "cardColor": cardColor.toExportableString(),
      "colorScheme": colorScheme.toString(),
    };
  }
}
