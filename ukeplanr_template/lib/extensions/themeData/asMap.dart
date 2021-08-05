import 'package:ukeplanr_template/extensions/color/asExportableString.dart';

import 'package:flutter/material.dart';

extension ConvertToMap on ThemeData {
  Map<String, String> toMap() {
    return {
      "dialogBackgroundColor": this.dialogBackgroundColor.toExportableString(),
      "toggleableActiveColor": this.toggleableActiveColor.toExportableString(),
      "unselectedWidgetColor": this.unselectedWidgetColor.toExportableString(),
      "secondaryHeaderColor": this.secondaryHeaderColor.toExportableString(),
      "primaryColorLight": this.primaryColorLight.toExportableString(),
      "bottomAppBarColor": this.bottomAppBarColor.toExportableString(),
      "selectedRowColor": this.selectedRowColor.toExportableString(),
      "primaryColorDark": this.primaryColorDark.toExportableString(),
      "backgroundColor": this.backgroundColor.toExportableString(),
      "highlightColor": this.highlightColor.toExportableString(),
      "indicatorColor": this.indicatorColor.toExportableString(),
      "disabledColor": this.disabledColor.toExportableString(),
      "dividerColor": this.dividerColor.toExportableString(),
      "primaryColor": this.primaryColor.toExportableString(),
      "scaffoldBackgroundColor":
          this.scaffoldBackgroundColor.toExportableString(),
      "shadowColor": this.shadowColor.toExportableString(),
      "splashColor": this.splashColor.toExportableString(),
      "canvasColor": this.canvasColor.toExportableString(),
      "buttonColor": this.buttonColor.toExportableString(),
      "accentColor": this.accentColor.toExportableString(),
      "errorColor": this.errorColor.toExportableString(),
      "focusColor": this.focusColor.toExportableString(),
      "hoverColor": this.hoverColor.toExportableString(),
      "hintColor": this.hintColor.toExportableString(),
      "cardColor": this.cardColor.toExportableString(),
    };
  }
}
