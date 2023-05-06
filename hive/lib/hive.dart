/// Hive is a lightweight and blazing fast key-value store written in pure Dart.
/// It is strongly encrypted using AES-256.
library hive;

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:hive/src/backend/storage_backend.dart';
import 'package:hive/src/box/default_compaction_strategy.dart';
import 'package:hive/src/box/default_key_comparator.dart';
import 'package:hive/src/crypto/aes_cbc_pkcs7.dart';
import 'package:hive/src/crypto/crc32.dart';
import 'package:hive/src/hive_impl.dart';
import 'package:hive/src/object/hive_list_impl.dart';
import 'package:hive/src/object/hive_object.dart';
import 'package:hive/src/util/extensions.dart';
import 'package:meta/meta.dart';

import 'src/backend/js/web_worker/web_worker_stub.dart'
    if (dart.library.html) 'src/backend/js/web_worker/web_worker.dart';

export 'package:hive/src/box_collection/box_collection.dart';

export 'src/backend/js/web_worker/web_worker_stub.dart'
    if (dart.library.html) 'src/backend/js/web_worker/web_worker.dart';
export 'src/backend/stub/storage_backend_memory.dart';
export 'src/object/hive_object.dart' show HiveObject, HiveObjectMixin;

part 'src/annotations/hive_field.dart';
