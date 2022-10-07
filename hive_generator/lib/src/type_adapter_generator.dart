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
