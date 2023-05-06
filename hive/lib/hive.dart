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
