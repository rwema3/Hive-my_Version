
String _displayString(DartType e) {
  var suffix = _suffixFromType(e);
  return '${e.getDisplayString(withNullability: false)}$suffix';
}
