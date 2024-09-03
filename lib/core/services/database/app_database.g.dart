// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AccountItemsTable extends AccountItems
    with TableInfo<$AccountItemsTable, AccountItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<AccountType>($AccountItemsTable.$convertertype);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 12),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color, type, currency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_items';
  @override
  VerificationContext validateIntegrity(Insertable<AccountItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      type: $AccountItemsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
    );
  }

  @override
  $AccountItemsTable createAlias(String alias) {
    return $AccountItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, int, int> $convertertype =
      const EnumIndexConverter<AccountType>(AccountType.values);
}

class AccountItem extends DataClass implements Insertable<AccountItem> {
  /// Unique identifier of the account
  final int id;

  /// Name of the account
  final String name;

  /// Color of the account represented stored in hexadecimal value
  final String? color;

  /// Type of account
  ///
  /// This value is stored as an int and the drift packages makes the conversion to an enum
  final AccountType type;

  /// Currency of the account
  ///
  /// This value is stored as the minified expression of the currency
  /// Eg. mxn, usd
  final String currency;
  const AccountItem(
      {required this.id,
      required this.name,
      this.color,
      required this.type,
      required this.currency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    {
      map['type'] =
          Variable<int>($AccountItemsTable.$convertertype.toSql(type));
    }
    map['currency'] = Variable<String>(currency);
    return map;
  }

  AccountItemsCompanion toCompanion(bool nullToAbsent) {
    return AccountItemsCompanion(
      id: Value(id),
      name: Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      type: Value(type),
      currency: Value(currency),
    );
  }

  factory AccountItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      type: $AccountItemsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      currency: serializer.fromJson<String>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'type': serializer
          .toJson<int>($AccountItemsTable.$convertertype.toJson(type)),
      'currency': serializer.toJson<String>(currency),
    };
  }

  AccountItem copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          AccountType? type,
          String? currency}) =>
      AccountItem(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        type: type ?? this.type,
        currency: currency ?? this.currency,
      );
  AccountItem copyWithCompanion(AccountItemsCompanion data) {
    return AccountItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('type: $type, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, type, currency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.type == this.type &&
          other.currency == this.currency);
}

class AccountItemsCompanion extends UpdateCompanion<AccountItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<AccountType> type;
  final Value<String> currency;
  const AccountItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
  });
  AccountItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    required String currency,
  })  : name = Value(name),
        currency = Value(currency);
  static Insertable<AccountItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<int>? type,
    Expression<String>? currency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
    });
  }

  AccountItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<AccountType>? type,
      Value<String>? currency}) {
    return AccountItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      type: type ?? this.type,
      currency: currency ?? this.currency,
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
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($AccountItemsTable.$convertertype.toSql(type.value));
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('type: $type, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountItemsTable accountItems = $AccountItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [accountItems];
}

typedef $$AccountItemsTableCreateCompanionBuilder = AccountItemsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  Value<AccountType> type,
  required String currency,
});
typedef $$AccountItemsTableUpdateCompanionBuilder = AccountItemsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<AccountType> type,
  Value<String> currency,
});

class $$AccountItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountItemsTable> {
  $$AccountItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<AccountType, AccountType, int> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AccountItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountItemsTable> {
  $$AccountItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AccountItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountItemsTable,
    AccountItem,
    $$AccountItemsTableFilterComposer,
    $$AccountItemsTableOrderingComposer,
    $$AccountItemsTableCreateCompanionBuilder,
    $$AccountItemsTableUpdateCompanionBuilder,
    (
      AccountItem,
      BaseReferences<_$AppDatabase, $AccountItemsTable, AccountItem>
    ),
    AccountItem,
    PrefetchHooks Function()> {
  $$AccountItemsTableTableManager(_$AppDatabase db, $AccountItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccountItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AccountItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<AccountType> type = const Value.absent(),
            Value<String> currency = const Value.absent(),
          }) =>
              AccountItemsCompanion(
            id: id,
            name: name,
            color: color,
            type: type,
            currency: currency,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> color = const Value.absent(),
            Value<AccountType> type = const Value.absent(),
            required String currency,
          }) =>
              AccountItemsCompanion.insert(
            id: id,
            name: name,
            color: color,
            type: type,
            currency: currency,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AccountItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountItemsTable,
    AccountItem,
    $$AccountItemsTableFilterComposer,
    $$AccountItemsTableOrderingComposer,
    $$AccountItemsTableCreateCompanionBuilder,
    $$AccountItemsTableUpdateCompanionBuilder,
    (
      AccountItem,
      BaseReferences<_$AppDatabase, $AccountItemsTable, AccountItem>
    ),
    AccountItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountItemsTableTableManager get accountItems =>
      $$AccountItemsTableTableManager(_db, _db.accountItems);
}
