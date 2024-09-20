// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BankItemsTable extends BankTable
    with TableInfo<$BankItemsTable, BankItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
      'logo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, logo, url, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_items';
  @override
  VerificationContext validateIntegrity(Insertable<BankItem> instance,
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
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $BankItemsTable createAlias(String alias) {
    return $BankItemsTable(attachedDatabase, alias);
  }
}

class BankItem extends DataClass implements Insertable<BankItem> {
  /// Unique identifier of the bank
  final int id;

  /// Name of the bank
  final String name;

  /// Color of the bank represented stored in hexadecimal value
  final String? color;

  /// Logo of the bank
  final String? logo;

  /// Url of the bank
  final String? url;

  /// Description of the bank
  final String? description;
  const BankItem(
      {required this.id,
      required this.name,
      this.color,
      this.logo,
      this.url,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  BankItemsCompanion toCompanion(bool nullToAbsent) {
    return BankItemsCompanion(
      id: Value(id),
      name: Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory BankItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      logo: serializer.fromJson<String?>(json['logo']),
      url: serializer.fromJson<String?>(json['url']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'logo': serializer.toJson<String?>(logo),
      'url': serializer.toJson<String?>(url),
      'description': serializer.toJson<String?>(description),
    };
  }

  BankItem copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          Value<String?> logo = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      BankItem(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        logo: logo.present ? logo.value : this.logo,
        url: url.present ? url.value : this.url,
        description: description.present ? description.value : this.description,
      );
  BankItem copyWithCompanion(BankItemsCompanion data) {
    return BankItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      logo: data.logo.present ? data.logo.value : this.logo,
      url: data.url.present ? data.url.value : this.url,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('logo: $logo, ')
          ..write('url: $url, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, logo, url, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.logo == this.logo &&
          other.url == this.url &&
          other.description == this.description);
}

class BankItemsCompanion extends UpdateCompanion<BankItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String?> logo;
  final Value<String?> url;
  final Value<String?> description;
  const BankItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.logo = const Value.absent(),
    this.url = const Value.absent(),
    this.description = const Value.absent(),
  });
  BankItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.logo = const Value.absent(),
    this.url = const Value.absent(),
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<BankItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? logo,
    Expression<String>? url,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (logo != null) 'logo': logo,
      if (url != null) 'url': url,
      if (description != null) 'description': description,
    });
  }

  BankItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<String?>? logo,
      Value<String?>? url,
      Value<String?>? description}) {
    return BankItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      logo: logo ?? this.logo,
      url: url ?? this.url,
      description: description ?? this.description,
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
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('logo: $logo, ')
          ..write('url: $url, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $AccountItemsTable extends AccountTable
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
  static const VerificationMeta _bankIdMeta = const VerificationMeta('bankId');
  @override
  late final GeneratedColumn<int> bankId = GeneratedColumn<int>(
      'bank_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES bank_items (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, type, currency, bankId];
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
    if (data.containsKey('bank_id')) {
      context.handle(_bankIdMeta,
          bankId.isAcceptableOrUnknown(data['bank_id']!, _bankIdMeta));
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
      bankId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bank_id']),
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

  /// Adds a reference for the bank that the account belongs to
  final int? bankId;
  const AccountItem(
      {required this.id,
      required this.name,
      this.color,
      required this.type,
      required this.currency,
      this.bankId});
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
    if (!nullToAbsent || bankId != null) {
      map['bank_id'] = Variable<int>(bankId);
    }
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
      bankId:
          bankId == null && nullToAbsent ? const Value.absent() : Value(bankId),
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
      bankId: serializer.fromJson<int?>(json['bankId']),
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
      'bankId': serializer.toJson<int?>(bankId),
    };
  }

  AccountItem copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          AccountType? type,
          String? currency,
          Value<int?> bankId = const Value.absent()}) =>
      AccountItem(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        bankId: bankId.present ? bankId.value : this.bankId,
      );
  AccountItem copyWithCompanion(AccountItemsCompanion data) {
    return AccountItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
      bankId: data.bankId.present ? data.bankId.value : this.bankId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('bankId: $bankId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, type, currency, bankId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.bankId == this.bankId);
}

class AccountItemsCompanion extends UpdateCompanion<AccountItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<AccountType> type;
  final Value<String> currency;
  final Value<int?> bankId;
  const AccountItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.bankId = const Value.absent(),
  });
  AccountItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    required String currency,
    this.bankId = const Value.absent(),
  })  : name = Value(name),
        currency = Value(currency);
  static Insertable<AccountItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<int>? type,
    Expression<String>? currency,
    Expression<int>? bankId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (bankId != null) 'bank_id': bankId,
    });
  }

  AccountItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<AccountType>? type,
      Value<String>? currency,
      Value<int?>? bankId}) {
    return AccountItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      bankId: bankId ?? this.bankId,
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
    if (bankId.present) {
      map['bank_id'] = Variable<int>(bankId.value);
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
          ..write('currency: $currency, ')
          ..write('bankId: $bankId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BankItemsTable bankItems = $BankItemsTable(this);
  late final $AccountItemsTable accountItems = $AccountItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bankItems, accountItems];
}

typedef $$BankItemsTableCreateCompanionBuilder = BankItemsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  Value<String?> logo,
  Value<String?> url,
  Value<String?> description,
});
typedef $$BankItemsTableUpdateCompanionBuilder = BankItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<String?> logo,
  Value<String?> url,
  Value<String?> description,
});

final class $$BankItemsTableReferences
    extends BaseReferences<_$AppDatabase, $BankItemsTable, BankItem> {
  $$BankItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountItemsTable, List<AccountItem>>
      _accountItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.accountItems,
          aliasName:
              $_aliasNameGenerator(db.bankItems.id, db.accountItems.bankId));

  $$AccountItemsTableProcessedTableManager get accountItemsRefs {
    final manager = $$AccountItemsTableTableManager($_db, $_db.accountItems)
        .filter((f) => f.bankId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_accountItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BankItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BankItemsTable> {
  $$BankItemsTableFilterComposer(super.$state);
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

  ColumnFilters<String> get logo => $state.composableBuilder(
      column: $state.table.logo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter accountItemsRefs(
      ComposableFilter Function($$AccountItemsTableFilterComposer f) f) {
    final $$AccountItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.accountItems,
        getReferencedColumn: (t) => t.bankId,
        builder: (joinBuilder, parentComposers) =>
            $$AccountItemsTableFilterComposer(ComposerState($state.db,
                $state.db.accountItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$BankItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BankItemsTable> {
  $$BankItemsTableOrderingComposer(super.$state);
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

  ColumnOrderings<String> get logo => $state.composableBuilder(
      column: $state.table.logo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BankItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankItemsTable,
    BankItem,
    $$BankItemsTableFilterComposer,
    $$BankItemsTableOrderingComposer,
    $$BankItemsTableCreateCompanionBuilder,
    $$BankItemsTableUpdateCompanionBuilder,
    (BankItem, $$BankItemsTableReferences),
    BankItem,
    PrefetchHooks Function({bool accountItemsRefs})> {
  $$BankItemsTableTableManager(_$AppDatabase db, $BankItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BankItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BankItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              BankItemsCompanion(
            id: id,
            name: name,
            color: color,
            logo: logo,
            url: url,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> color = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              BankItemsCompanion.insert(
            id: id,
            name: name,
            color: color,
            logo: logo,
            url: url,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BankItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({accountItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountItemsRefs) db.accountItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$BankItemsTableReferences
                            ._accountItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BankItemsTableReferences(db, table, p0)
                                .accountItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.bankId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BankItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BankItemsTable,
    BankItem,
    $$BankItemsTableFilterComposer,
    $$BankItemsTableOrderingComposer,
    $$BankItemsTableCreateCompanionBuilder,
    $$BankItemsTableUpdateCompanionBuilder,
    (BankItem, $$BankItemsTableReferences),
    BankItem,
    PrefetchHooks Function({bool accountItemsRefs})>;
typedef $$AccountItemsTableCreateCompanionBuilder = AccountItemsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  Value<AccountType> type,
  required String currency,
  Value<int?> bankId,
});
typedef $$AccountItemsTableUpdateCompanionBuilder = AccountItemsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<AccountType> type,
  Value<String> currency,
  Value<int?> bankId,
});

final class $$AccountItemsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountItemsTable, AccountItem> {
  $$AccountItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BankItemsTable _bankIdTable(_$AppDatabase db) =>
      db.bankItems.createAlias(
          $_aliasNameGenerator(db.accountItems.bankId, db.bankItems.id));

  $$BankItemsTableProcessedTableManager? get bankId {
    if ($_item.bankId == null) return null;
    final manager = $$BankItemsTableTableManager($_db, $_db.bankItems)
        .filter((f) => f.id($_item.bankId!));
    final item = $_typedResult.readTableOrNull(_bankIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

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

  $$BankItemsTableFilterComposer get bankId {
    final $$BankItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $state.db.bankItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BankItemsTableFilterComposer(ComposerState(
                $state.db, $state.db.bankItems, joinBuilder, parentComposers)));
    return composer;
  }
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

  $$BankItemsTableOrderingComposer get bankId {
    final $$BankItemsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $state.db.bankItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BankItemsTableOrderingComposer(ComposerState(
                $state.db, $state.db.bankItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AccountItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountItemsTable,
    AccountItem,
    $$AccountItemsTableFilterComposer,
    $$AccountItemsTableOrderingComposer,
    $$AccountItemsTableCreateCompanionBuilder,
    $$AccountItemsTableUpdateCompanionBuilder,
    (AccountItem, $$AccountItemsTableReferences),
    AccountItem,
    PrefetchHooks Function({bool bankId})> {
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
            Value<int?> bankId = const Value.absent(),
          }) =>
              AccountItemsCompanion(
            id: id,
            name: name,
            color: color,
            type: type,
            currency: currency,
            bankId: bankId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> color = const Value.absent(),
            Value<AccountType> type = const Value.absent(),
            required String currency,
            Value<int?> bankId = const Value.absent(),
          }) =>
              AccountItemsCompanion.insert(
            id: id,
            name: name,
            color: color,
            type: type,
            currency: currency,
            bankId: bankId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AccountItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bankId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (bankId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.bankId,
                    referencedTable:
                        $$AccountItemsTableReferences._bankIdTable(db),
                    referencedColumn:
                        $$AccountItemsTableReferences._bankIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
    (AccountItem, $$AccountItemsTableReferences),
    AccountItem,
    PrefetchHooks Function({bool bankId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BankItemsTableTableManager get bankItems =>
      $$BankItemsTableTableManager(_db, _db.bankItems);
  $$AccountItemsTableTableManager get accountItems =>
      $$AccountItemsTableTableManager(_db, _db.accountItems);
}
