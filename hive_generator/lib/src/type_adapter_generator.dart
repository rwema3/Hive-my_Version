import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:hive/hive.dart';
import 'package:hive_generator/src/builder.dart';
import 'package:hive_generator/src/class_builder.dart';
import 'package:hive_generator/src/enum_builder.dart';
import 'package:hive_generator/src/helper.dart';
import 'package:source_gen/source_gen.dart';

class TypeAdapterGenerator extends GeneratorForAnnotation<HiveType> {
  static String generateName(String typeName) {
    var adapterName =
        '${typeName}Adapter'.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '');
    if (adapterName.startsWith('_')) {
      adapterName = adapterName.substring(1);
    }
    if (adapterName.startsWith(r'$')) {
      adapterName = adapterName.substring(1);
    }
    return adapterName;
  }

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    var cls = getClass(element);
    var library = await buildStep.inputLibrary;
    var gettersAndSetters = getAccessors(cls, library);

    var getters = gettersAndSetters[0];
    verifyFieldIndices(getters);

    var setters = gettersAndSetters[1];
    verifyFieldIndices(setters);

    var typeId = getTypeId(annotation);

    var adapterName = getAdapterName(cls.name, annotation);
    var builder = cls.isEnum
        ? EnumBuilder(cls, getters)
        : ClassBuilder(cls, getters, setters);

    return '''
    class $adapterName extends TypeAdapter<${cls.name}> {
      @override
      final int typeId = $typeId;

      @override
      ${cls.name} read(BinaryReader reader) {
        ${builder.buildRead()}
      }

      @override
      void write(BinaryWriter writer, ${cls.name} obj) {
        ${builder.buildWrite()}
      }
