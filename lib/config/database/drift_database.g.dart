// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PokemonsTable extends Pokemons with TableInfo<$PokemonsTable, Pokemon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _spriteFrontMeta =
      const VerificationMeta('spriteFront');
  @override
  late final GeneratedColumn<String> spriteFront = GeneratedColumn<String>(
      'sprite_front', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, spriteFront];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemons';
  @override
  VerificationContext validateIntegrity(Insertable<Pokemon> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sprite_front')) {
      context.handle(
          _spriteFrontMeta,
          spriteFront.isAcceptableOrUnknown(
              data['sprite_front']!, _spriteFrontMeta));
    } else if (isInserting) {
      context.missing(_spriteFrontMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Pokemon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pokemon(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      spriteFront: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sprite_front'])!,
    );
  }

  @override
  $PokemonsTable createAlias(String alias) {
    return $PokemonsTable(attachedDatabase, alias);
  }
}

class Pokemon extends DataClass implements Insertable<Pokemon> {
  final int id;
  final String name;
  final String spriteFront;
  const Pokemon(
      {required this.id, required this.name, required this.spriteFront});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sprite_front'] = Variable<String>(spriteFront);
    return map;
  }

  PokemonsCompanion toCompanion(bool nullToAbsent) {
    return PokemonsCompanion(
      id: Value(id),
      name: Value(name),
      spriteFront: Value(spriteFront),
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pokemon(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      spriteFront: serializer.fromJson<String>(json['spriteFront']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'spriteFront': serializer.toJson<String>(spriteFront),
    };
  }

  Pokemon copyWith({int? id, String? name, String? spriteFront}) => Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        spriteFront: spriteFront ?? this.spriteFront,
      );
  Pokemon copyWithCompanion(PokemonsCompanion data) {
    return Pokemon(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      spriteFront:
          data.spriteFront.present ? data.spriteFront.value : this.spriteFront,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pokemon(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('spriteFront: $spriteFront')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, spriteFront);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pokemon &&
          other.id == this.id &&
          other.name == this.name &&
          other.spriteFront == this.spriteFront);
}

class PokemonsCompanion extends UpdateCompanion<Pokemon> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> spriteFront;
  final Value<int> rowid;
  const PokemonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.spriteFront = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonsCompanion.insert({
    required int id,
    required String name,
    required String spriteFront,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        spriteFront = Value(spriteFront);
  static Insertable<Pokemon> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? spriteFront,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (spriteFront != null) 'sprite_front': spriteFront,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? spriteFront,
      Value<int>? rowid}) {
    return PokemonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      spriteFront: spriteFront ?? this.spriteFront,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (spriteFront.present) {
      map['sprite_front'] = Variable<String>(spriteFront.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('spriteFront: $spriteFront, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PokemonsTable pokemons = $PokemonsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemons];
}

typedef $$PokemonsTableCreateCompanionBuilder = PokemonsCompanion Function({
  required int id,
  required String name,
  required String spriteFront,
  Value<int> rowid,
});
typedef $$PokemonsTableUpdateCompanionBuilder = PokemonsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> spriteFront,
  Value<int> rowid,
});

class $$PokemonsTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spriteFront => $composableBuilder(
      column: $table.spriteFront, builder: (column) => ColumnFilters(column));
}

class $$PokemonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spriteFront => $composableBuilder(
      column: $table.spriteFront, builder: (column) => ColumnOrderings(column));
}

class $$PokemonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get spriteFront => $composableBuilder(
      column: $table.spriteFront, builder: (column) => column);
}

class $$PokemonsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonsTable,
    Pokemon,
    $$PokemonsTableFilterComposer,
    $$PokemonsTableOrderingComposer,
    $$PokemonsTableAnnotationComposer,
    $$PokemonsTableCreateCompanionBuilder,
    $$PokemonsTableUpdateCompanionBuilder,
    (Pokemon, BaseReferences<_$AppDatabase, $PokemonsTable, Pokemon>),
    Pokemon,
    PrefetchHooks Function()> {
  $$PokemonsTableTableManager(_$AppDatabase db, $PokemonsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> spriteFront = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonsCompanion(
            id: id,
            name: name,
            spriteFront: spriteFront,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String name,
            required String spriteFront,
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonsCompanion.insert(
            id: id,
            name: name,
            spriteFront: spriteFront,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PokemonsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonsTable,
    Pokemon,
    $$PokemonsTableFilterComposer,
    $$PokemonsTableOrderingComposer,
    $$PokemonsTableAnnotationComposer,
    $$PokemonsTableCreateCompanionBuilder,
    $$PokemonsTableUpdateCompanionBuilder,
    (Pokemon, BaseReferences<_$AppDatabase, $PokemonsTable, Pokemon>),
    Pokemon,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PokemonsTableTableManager get pokemons =>
      $$PokemonsTableTableManager(_db, _db.pokemons);
}
