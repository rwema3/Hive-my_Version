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

  if (revivable.source.fragment.isEmpty) {
    // Enums
    return revivable.accessor;
  } else {
    // Classes
    final nextTypeInformation = [...typeInformation, '$object'];
    final prefix = kConstConstructors ? 'const ' : '';
    final ctor = revivable.accessor.isEmpty ? '' : '.${revivable.accessor}';
