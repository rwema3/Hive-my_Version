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
    final arguments = <String>[
      for (var arg in revivable.positionalArguments)
        constantToString(arg, nextTypeInformation),
      for (var kv in revivable.namedArguments.entries)
        '${kv.key}: ${constantToString(kv.value, nextTypeInformation)}'
    ];

    return '$prefix${revivable.source.fragment}$ctor(${arguments.join(', ')})';
  }
}

