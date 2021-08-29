extension RawListString on List {
  String toRawString() {
    String rawString = "";
    for (var object in this) {
      rawString += "$object \n";
    }
    return rawString;
  }
}
