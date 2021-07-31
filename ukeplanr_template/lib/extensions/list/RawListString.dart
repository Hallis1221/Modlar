extension RawListString on List {
  String RawString() {
    String rawString = "";
    for (var object in this) {
      rawString += "$object \n";
    }
    return rawString;
  }
}
