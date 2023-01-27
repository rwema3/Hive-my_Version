/// Hive is a lightweight and blazing fast key-value store written in pure Dart.
/// It is strongly encrypted using AES-256.

import 'src/backend/js/web_worker/web_worker_stub.dart'
    if (dart.library.html) 'src/backend/js/web_worker/web_worker.dart';

export 'package:hive/src/box_collection/box_collection.dart';

export 'src/backend/js/web_worker/web_worker_stub.dart'
    if (dart.library.html) 'src/backend/js/web_worker/web_worker.dart';
export 'src/backend/stub/storage_backend_memory.dart';
export 'src/object/hive_object.dart' show HiveObject, HiveObjectMixin;

part 'src/annotations/hive_field.dart';

part 'src/annotations/hive_type.dart';

part 'src/binary/binary_reader.dart';

part 'src/binary/binary_writer.dart';

part 'src/box/box.dart';

part 'src/box/box_base.dart';

part 'src/box/lazy_box.dart';

part 'src/crypto/hive_aes_cipher.dart';

part 'src/crypto/hive_cipher.dart';

part 'src/hive.dart';

part 'src/hive_error.dart';

part 'src/object/hive_collection.dart';

part 'src/object/hive_list.dart';

part 'src/object/hive_storage_backend_preference.dart';

part 'src/registry/type_adapter.dart';

part 'src/registry/type_registry.dart';

/// Global constant to access Hive.
// ignore: non_constant_identifier_names
final HiveInterface Hive = HiveImpl();
