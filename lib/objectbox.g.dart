// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'main.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6672900799472669022),
      name: 'KeyValue',
      lastPropertyId: const IdUid(3, 143789602559127632),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7609433838212001022),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 533350502974632437),
            name: 'key',
            type: 9,
            flags: 2048,
            indexId: const IdUid(1, 3627269501912029414)),
        ModelProperty(
            id: const IdUid(3, 143789602559127632),
            name: 'value',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 6672900799472669022),
      lastIndexId: const IdUid(1, 3627269501912029414),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    KeyValue: EntityDefinition<KeyValue>(
        model: _entities[0],
        toOneRelations: (KeyValue object) => [],
        toManyRelations: (KeyValue object) => {},
        getId: (KeyValue object) => object.id,
        setId: (KeyValue object, int id) {
          object.id = id;
        },
        objectToFB: (KeyValue object, fb.Builder fbb) {
          final keyOffset =
              object.key == null ? null : fbb.writeString(object.key!);
          final valueOffset =
              object.value == null ? null : fbb.writeString(object.value!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, keyOffset);
          fbb.addOffset(2, valueOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = KeyValue()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..key = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..value = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [KeyValue] entity fields to define ObjectBox queries.
class KeyValue_ {
  /// see [KeyValue.id]
  static final id = QueryIntegerProperty<KeyValue>(_entities[0].properties[0]);

  /// see [KeyValue.key]
  static final key = QueryStringProperty<KeyValue>(_entities[0].properties[1]);

  /// see [KeyValue.value]
  static final value =
      QueryStringProperty<KeyValue>(_entities[0].properties[2]);
}
