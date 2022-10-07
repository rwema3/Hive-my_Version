  List<String> typeInformation = const [],
]) {
  if (object == null || object.isNull) return 'null';
  final reader = ConstantReader(object);
  return reader.isLiteral
      ? literalToString(object, typeInformation)
      : revivableToString(object, typeInformation);
}

String revivableToString(DartObject? object, List<String> typeInformation) {
  final reader = ConstantReader(object);
  final revivable = reader.revive();
