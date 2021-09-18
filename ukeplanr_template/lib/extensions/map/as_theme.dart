import 'package:flutter/material.dart';

// This lint warning is false. You should not specify type on a extension
//ignore: always_specify_types
extension ConvertToTheme on Map {
  ThemeData toTheme() {
    return ThemeData(
      dialogBackgroundColor: Color(int.parse(this["dialogBackgroundColor"])),
      toggleableActiveColor: Color(int.parse(this["toggleableActiveColor"])),
      unselectedWidgetColor: Color(int.parse(this["unselectedWidgetColor"])),
      secondaryHeaderColor: Color(int.parse(this["secondaryHeaderColor"])),
      primaryColorLight: Color(int.parse(this["primaryColorLight"])),
      bottomAppBarColor: Color(int.parse(this["bottomAppBarColor"])),
      selectedRowColor: Color(int.parse(this["selectedRowColor"])),
      primaryColorDark: Color(int.parse(this["primaryColorDark"])),
      backgroundColor: Color(int.parse(this["backgroundColor"])),
      highlightColor: Color(int.parse(this["highlightColor"])),
      indicatorColor: Color(int.parse(this["indicatorColor"])),
      disabledColor: Color(int.parse(this["disabledColor"])),
      scaffoldBackgroundColor:
          Color(int.parse(this["scaffoldBackgroundColor"])),
      dividerColor: Color(int.parse(this["dividerColor"])),
      primaryColor: Color(int.parse(this["primaryColor"])),
      shadowColor: Color(int.parse(this["shadowColor"])),
      splashColor: Color(int.parse(this["splashColor"])),
      canvasColor: Color(int.parse(this["canvasColor"])),
      buttonColor: Color(int.parse(this["buttonColor"])),
      accentColor: Color(int.parse(this["accentColor"])),
      errorColor: Color(int.parse(this["errorColor"])),
      focusColor: Color(int.parse(this["focusColor"])),
      hoverColor: Color(int.parse(this["hoverColor"])),
      hintColor: Color(int.parse(this["hintColor"])),
      cardColor: Color(int.parse(this["cardColor"])),
    );
  }
}
