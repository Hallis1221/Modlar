// This lint warning is false. You should not specify type on a extension
//ignore: always_specify_types
extension RawListString on List {
  String toRawString() {
    String rawString = "";
    for (dynamic listObject in this) {
      rawString += "$listObject \n";
    }
    return rawString;
  }
}
