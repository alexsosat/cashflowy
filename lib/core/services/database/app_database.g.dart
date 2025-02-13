// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BankTableTable extends BankTable
    with TableInfo<$BankTableTable, BankTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankTableTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'bank_table';
  @override
  VerificationContext validateIntegrity(Insertable<BankTableData> instance,
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
  BankTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankTableData(
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
  $BankTableTable createAlias(String alias) {
    return $BankTableTable(attachedDatabase, alias);
  }
}

class BankTableData extends DataClass implements Insertable<BankTableData> {
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
  const BankTableData(
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

  BankTableCompanion toCompanion(bool nullToAbsent) {
    return BankTableCompanion(
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

  factory BankTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankTableData(
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

  BankTableData copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          Value<String?> logo = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      BankTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        logo: logo.present ? logo.value : this.logo,
        url: url.present ? url.value : this.url,
        description: description.present ? description.value : this.description,
      );
  BankTableData copyWithCompanion(BankTableCompanion data) {
    return BankTableData(
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
    return (StringBuffer('BankTableData(')
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
      (other is BankTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.logo == this.logo &&
          other.url == this.url &&
          other.description == this.description);
}

class BankTableCompanion extends UpdateCompanion<BankTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String?> logo;
  final Value<String?> url;
  final Value<String?> description;
  const BankTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.logo = const Value.absent(),
    this.url = const Value.absent(),
    this.description = const Value.absent(),
  });
  BankTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.logo = const Value.absent(),
    this.url = const Value.absent(),
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<BankTableData> custom({
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

  BankTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<String?>? logo,
      Value<String?>? url,
      Value<String?>? description}) {
    return BankTableCompanion(
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
    return (StringBuffer('BankTableCompanion(')
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

class $AccountTableTable extends AccountTable
    with TableInfo<$AccountTableTable, AccountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTableTable(this.attachedDatabase, [this._alias]);
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
          .withConverter<AccountType>($AccountTableTable.$convertertype);
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
          GeneratedColumn.constraintIsAlways('REFERENCES bank_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, type, currency, bankId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_table';
  @override
  VerificationContext validateIntegrity(Insertable<AccountTableData> instance,
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
  AccountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      type: $AccountTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      bankId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bank_id']),
    );
  }

  @override
  $AccountTableTable createAlias(String alias) {
    return $AccountTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, int, int> $convertertype =
      const EnumIndexConverter<AccountType>(AccountType.values);
}

class AccountTableData extends DataClass
    implements Insertable<AccountTableData> {
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
  const AccountTableData(
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
          Variable<int>($AccountTableTable.$convertertype.toSql(type));
    }
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || bankId != null) {
      map['bank_id'] = Variable<int>(bankId);
    }
    return map;
  }

  AccountTableCompanion toCompanion(bool nullToAbsent) {
    return AccountTableCompanion(
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

  factory AccountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      type: $AccountTableTable.$convertertype
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
          .toJson<int>($AccountTableTable.$convertertype.toJson(type)),
      'currency': serializer.toJson<String>(currency),
      'bankId': serializer.toJson<int?>(bankId),
    };
  }

  AccountTableData copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          AccountType? type,
          String? currency,
          Value<int?> bankId = const Value.absent()}) =>
      AccountTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        bankId: bankId.present ? bankId.value : this.bankId,
      );
  AccountTableData copyWithCompanion(AccountTableCompanion data) {
    return AccountTableData(
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
    return (StringBuffer('AccountTableData(')
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
      (other is AccountTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.bankId == this.bankId);
}

class AccountTableCompanion extends UpdateCompanion<AccountTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<AccountType> type;
  final Value<String> currency;
  final Value<int?> bankId;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.bankId = const Value.absent(),
  });
  AccountTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    required String currency,
    this.bankId = const Value.absent(),
  })  : name = Value(name),
        currency = Value(currency);
  static Insertable<AccountTableData> custom({
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

  AccountTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<AccountType>? type,
      Value<String>? currency,
      Value<int?>? bankId}) {
    return AccountTableCompanion(
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
          Variable<int>($AccountTableTable.$convertertype.toSql(type.value));
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
    return (StringBuffer('AccountTableCompanion(')
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

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
      'icon', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isExpenseMeta =
      const VerificationMeta('isExpense');
  @override
  late final GeneratedColumn<bool> isExpense = GeneratedColumn<bool>(
      'is_expense', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_expense" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, name, color, icon, isExpense];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
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
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('is_expense')) {
      context.handle(_isExpenseMeta,
          isExpense.isAcceptableOrUnknown(data['is_expense']!, _isExpenseMeta));
    } else if (isInserting) {
      context.missing(_isExpenseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon'])!,
      isExpense: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_expense'])!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  /// Unique identifier of the category
  final int id;

  /// Name of the category
  final String name;

  /// Color of the category
  ///
  /// Saved as a hexadecimal value
  final String color;

  /// Icon of the category
  ///
  /// Saved as code point of the icon
  final int icon;

  /// Indicates the default nature of the category
  ///
  /// True if it is an expense, false otherwise
  final bool isExpense;
  const CategoryTableData(
      {required this.id,
      required this.name,
      required this.color,
      required this.icon,
      required this.isExpense});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    map['icon'] = Variable<int>(icon);
    map['is_expense'] = Variable<bool>(isExpense);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      icon: Value(icon),
      isExpense: Value(isExpense),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      icon: serializer.fromJson<int>(json['icon']),
      isExpense: serializer.fromJson<bool>(json['isExpense']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'icon': serializer.toJson<int>(icon),
      'isExpense': serializer.toJson<bool>(isExpense),
    };
  }

  CategoryTableData copyWith(
          {int? id, String? name, String? color, int? icon, bool? isExpense}) =>
      CategoryTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        isExpense: isExpense ?? this.isExpense,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      icon: data.icon.present ? data.icon.value : this.icon,
      isExpense: data.isExpense.present ? data.isExpense.value : this.isExpense,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('isExpense: $isExpense')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, icon, isExpense);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.icon == this.icon &&
          other.isExpense == this.isExpense);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<int> icon;
  final Value<bool> isExpense;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.isExpense = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
    required int icon,
    required bool isExpense,
  })  : name = Value(name),
        color = Value(color),
        icon = Value(icon),
        isExpense = Value(isExpense);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<int>? icon,
    Expression<bool>? isExpense,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (icon != null) 'icon': icon,
      if (isExpense != null) 'is_expense': isExpense,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? color,
      Value<int>? icon,
      Value<bool>? isExpense}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      isExpense: isExpense ?? this.isExpense,
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
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (isExpense.present) {
      map['is_expense'] = Variable<bool>(isExpense.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('isExpense: $isExpense')
          ..write(')'))
        .toString();
  }
}

class $LifeSpanTableTable extends LifeSpanTable
    with TableInfo<$LifeSpanTableTable, LifeSpanTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LifeSpanTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumnWithTypeConverter<LifeSpanUnits, int> unit =
      GeneratedColumn<int>('unit', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LifeSpanUnits>($LifeSpanTableTable.$converterunit);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expirationDateMeta =
      const VerificationMeta('expirationDate');
  @override
  late final GeneratedColumn<DateTime> expirationDate =
      GeneratedColumn<DateTime>('expiration_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, unit, value, expirationDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'life_span_table';
  @override
  VerificationContext validateIntegrity(Insertable<LifeSpanTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_unitMeta, const VerificationResult.success());
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('expiration_date')) {
      context.handle(
          _expirationDateMeta,
          expirationDate.isAcceptableOrUnknown(
              data['expiration_date']!, _expirationDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LifeSpanTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LifeSpanTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      unit: $LifeSpanTableTable.$converterunit.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit'])!),
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value'])!,
      expirationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}expiration_date']),
    );
  }

  @override
  $LifeSpanTableTable createAlias(String alias) {
    return $LifeSpanTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LifeSpanUnits, int, int> $converterunit =
      const EnumIndexConverter<LifeSpanUnits>(LifeSpanUnits.values);
}

class LifeSpanTableData extends DataClass
    implements Insertable<LifeSpanTableData> {
  /// Unique identifier of the life span
  final int id;

  /// Unit measurement of the life span
  final LifeSpanUnits unit;

  /// Value of the life span
  final int value;

  /// Expiration date of the life span
  ///
  /// Null if the life span is infinite
  final DateTime? expirationDate;
  const LifeSpanTableData(
      {required this.id,
      required this.unit,
      required this.value,
      this.expirationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['unit'] =
          Variable<int>($LifeSpanTableTable.$converterunit.toSql(unit));
    }
    map['value'] = Variable<int>(value);
    if (!nullToAbsent || expirationDate != null) {
      map['expiration_date'] = Variable<DateTime>(expirationDate);
    }
    return map;
  }

  LifeSpanTableCompanion toCompanion(bool nullToAbsent) {
    return LifeSpanTableCompanion(
      id: Value(id),
      unit: Value(unit),
      value: Value(value),
      expirationDate: expirationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expirationDate),
    );
  }

  factory LifeSpanTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LifeSpanTableData(
      id: serializer.fromJson<int>(json['id']),
      unit: $LifeSpanTableTable.$converterunit
          .fromJson(serializer.fromJson<int>(json['unit'])),
      value: serializer.fromJson<int>(json['value']),
      expirationDate: serializer.fromJson<DateTime?>(json['expirationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'unit': serializer
          .toJson<int>($LifeSpanTableTable.$converterunit.toJson(unit)),
      'value': serializer.toJson<int>(value),
      'expirationDate': serializer.toJson<DateTime?>(expirationDate),
    };
  }

  LifeSpanTableData copyWith(
          {int? id,
          LifeSpanUnits? unit,
          int? value,
          Value<DateTime?> expirationDate = const Value.absent()}) =>
      LifeSpanTableData(
        id: id ?? this.id,
        unit: unit ?? this.unit,
        value: value ?? this.value,
        expirationDate:
            expirationDate.present ? expirationDate.value : this.expirationDate,
      );
  LifeSpanTableData copyWithCompanion(LifeSpanTableCompanion data) {
    return LifeSpanTableData(
      id: data.id.present ? data.id.value : this.id,
      unit: data.unit.present ? data.unit.value : this.unit,
      value: data.value.present ? data.value.value : this.value,
      expirationDate: data.expirationDate.present
          ? data.expirationDate.value
          : this.expirationDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LifeSpanTableData(')
          ..write('id: $id, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('expirationDate: $expirationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unit, value, expirationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LifeSpanTableData &&
          other.id == this.id &&
          other.unit == this.unit &&
          other.value == this.value &&
          other.expirationDate == this.expirationDate);
}

class LifeSpanTableCompanion extends UpdateCompanion<LifeSpanTableData> {
  final Value<int> id;
  final Value<LifeSpanUnits> unit;
  final Value<int> value;
  final Value<DateTime?> expirationDate;
  const LifeSpanTableCompanion({
    this.id = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.expirationDate = const Value.absent(),
  });
  LifeSpanTableCompanion.insert({
    this.id = const Value.absent(),
    required LifeSpanUnits unit,
    required int value,
    this.expirationDate = const Value.absent(),
  })  : unit = Value(unit),
        value = Value(value);
  static Insertable<LifeSpanTableData> custom({
    Expression<int>? id,
    Expression<int>? unit,
    Expression<int>? value,
    Expression<DateTime>? expirationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unit != null) 'unit': unit,
      if (value != null) 'value': value,
      if (expirationDate != null) 'expiration_date': expirationDate,
    });
  }

  LifeSpanTableCompanion copyWith(
      {Value<int>? id,
      Value<LifeSpanUnits>? unit,
      Value<int>? value,
      Value<DateTime?>? expirationDate}) {
    return LifeSpanTableCompanion(
      id: id ?? this.id,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (unit.present) {
      map['unit'] =
          Variable<int>($LifeSpanTableTable.$converterunit.toSql(unit.value));
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (expirationDate.present) {
      map['expiration_date'] = Variable<DateTime>(expirationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LifeSpanTableCompanion(')
          ..write('id: $id, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('expirationDate: $expirationDate')
          ..write(')'))
        .toString();
  }
}

class $AccountReportTableTable extends AccountReportTable
    with TableInfo<$AccountReportTableTable, AccountReportTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountReportTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _initialMoneyMeta =
      const VerificationMeta('initialMoney');
  @override
  late final GeneratedColumn<double> initialMoney = GeneratedColumn<double>(
      'initial_money', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES account_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, initialMoney, startDate, endDate, accountId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_report_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AccountReportTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('initial_money')) {
      context.handle(
          _initialMoneyMeta,
          initialMoney.isAcceptableOrUnknown(
              data['initial_money']!, _initialMoneyMeta));
    } else if (isInserting) {
      context.missing(_initialMoneyMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountReportTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountReportTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      initialMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_money'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
    );
  }

  @override
  $AccountReportTableTable createAlias(String alias) {
    return $AccountReportTableTable(attachedDatabase, alias);
  }
}

class AccountReportTableData extends DataClass
    implements Insertable<AccountReportTableData> {
  /// Unique identifier of the bank
  final int id;

  /// Initial money of the account
  final double initialMoney;

  /// Start date of the report
  final DateTime startDate;

  /// End date of the report
  final DateTime endDate;

  /// Adds a reference for the account that the report belongs to
  final int accountId;
  const AccountReportTableData(
      {required this.id,
      required this.initialMoney,
      required this.startDate,
      required this.endDate,
      required this.accountId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['initial_money'] = Variable<double>(initialMoney);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['account_id'] = Variable<int>(accountId);
    return map;
  }

  AccountReportTableCompanion toCompanion(bool nullToAbsent) {
    return AccountReportTableCompanion(
      id: Value(id),
      initialMoney: Value(initialMoney),
      startDate: Value(startDate),
      endDate: Value(endDate),
      accountId: Value(accountId),
    );
  }

  factory AccountReportTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountReportTableData(
      id: serializer.fromJson<int>(json['id']),
      initialMoney: serializer.fromJson<double>(json['initialMoney']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      accountId: serializer.fromJson<int>(json['accountId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'initialMoney': serializer.toJson<double>(initialMoney),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'accountId': serializer.toJson<int>(accountId),
    };
  }

  AccountReportTableData copyWith(
          {int? id,
          double? initialMoney,
          DateTime? startDate,
          DateTime? endDate,
          int? accountId}) =>
      AccountReportTableData(
        id: id ?? this.id,
        initialMoney: initialMoney ?? this.initialMoney,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        accountId: accountId ?? this.accountId,
      );
  AccountReportTableData copyWithCompanion(AccountReportTableCompanion data) {
    return AccountReportTableData(
      id: data.id.present ? data.id.value : this.id,
      initialMoney: data.initialMoney.present
          ? data.initialMoney.value
          : this.initialMoney,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountReportTableData(')
          ..write('id: $id, ')
          ..write('initialMoney: $initialMoney, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('accountId: $accountId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, initialMoney, startDate, endDate, accountId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountReportTableData &&
          other.id == this.id &&
          other.initialMoney == this.initialMoney &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.accountId == this.accountId);
}

class AccountReportTableCompanion
    extends UpdateCompanion<AccountReportTableData> {
  final Value<int> id;
  final Value<double> initialMoney;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<int> accountId;
  const AccountReportTableCompanion({
    this.id = const Value.absent(),
    this.initialMoney = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.accountId = const Value.absent(),
  });
  AccountReportTableCompanion.insert({
    this.id = const Value.absent(),
    required double initialMoney,
    required DateTime startDate,
    required DateTime endDate,
    required int accountId,
  })  : initialMoney = Value(initialMoney),
        startDate = Value(startDate),
        endDate = Value(endDate),
        accountId = Value(accountId);
  static Insertable<AccountReportTableData> custom({
    Expression<int>? id,
    Expression<double>? initialMoney,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? accountId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (initialMoney != null) 'initial_money': initialMoney,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (accountId != null) 'account_id': accountId,
    });
  }

  AccountReportTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? initialMoney,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<int>? accountId}) {
    return AccountReportTableCompanion(
      id: id ?? this.id,
      initialMoney: initialMoney ?? this.initialMoney,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      accountId: accountId ?? this.accountId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (initialMoney.present) {
      map['initial_money'] = Variable<double>(initialMoney.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountReportTableCompanion(')
          ..write('id: $id, ')
          ..write('initialMoney: $initialMoney, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('accountId: $accountId')
          ..write(')'))
        .toString();
  }
}

class $TransactionTableTable extends TransactionTable
    with TableInfo<$TransactionTableTable, TransactionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<TransactionTypes, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TransactionTypes>(
              $TransactionTableTable.$convertertype);
  static const VerificationMeta _isExpenseMeta =
      const VerificationMeta('isExpense');
  @override
  late final GeneratedColumn<bool> isExpense = GeneratedColumn<bool>(
      'is_expense', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_expense" IN (0, 1))'));
  static const VerificationMeta _isApprovedMeta =
      const VerificationMeta('isApproved');
  @override
  late final GeneratedColumn<bool> isApproved = GeneratedColumn<bool>(
      'is_approved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_approved" IN (0, 1))'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category_table (id)'));
  static const VerificationMeta _accountReportIdMeta =
      const VerificationMeta('accountReportId');
  @override
  late final GeneratedColumn<int> accountReportId = GeneratedColumn<int>(
      'account_report_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES account_report_table (id)'));
  static const VerificationMeta _lifeSpanIdMeta =
      const VerificationMeta('lifeSpanId');
  @override
  late final GeneratedColumn<int> lifeSpanId = GeneratedColumn<int>(
      'life_span_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES life_span_table (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        paymentDate,
        title,
        type,
        isExpense,
        isApproved,
        categoryId,
        accountReportId,
        lifeSpanId,
        description
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('is_expense')) {
      context.handle(_isExpenseMeta,
          isExpense.isAcceptableOrUnknown(data['is_expense']!, _isExpenseMeta));
    } else if (isInserting) {
      context.missing(_isExpenseMeta);
    }
    if (data.containsKey('is_approved')) {
      context.handle(
          _isApprovedMeta,
          isApproved.isAcceptableOrUnknown(
              data['is_approved']!, _isApprovedMeta));
    } else if (isInserting) {
      context.missing(_isApprovedMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('account_report_id')) {
      context.handle(
          _accountReportIdMeta,
          accountReportId.isAcceptableOrUnknown(
              data['account_report_id']!, _accountReportIdMeta));
    } else if (isInserting) {
      context.missing(_accountReportIdMeta);
    }
    if (data.containsKey('life_span_id')) {
      context.handle(
          _lifeSpanIdMeta,
          lifeSpanId.isAcceptableOrUnknown(
              data['life_span_id']!, _lifeSpanIdMeta));
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
  TransactionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: $TransactionTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      isExpense: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_expense'])!,
      isApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_approved'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      accountReportId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_report_id'])!,
      lifeSpanId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}life_span_id']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TransactionTableTable createAlias(String alias) {
    return $TransactionTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionTypes, int, int> $convertertype =
      const EnumIndexConverter<TransactionTypes>(TransactionTypes.values);
}

class TransactionTableData extends DataClass
    implements Insertable<TransactionTableData> {
  /// Unique identifier of the transaction
  final int id;

  /// Amount of the transaction
  final double amount;

  /// Date of the transaction
  final DateTime paymentDate;

  /// Description of the transaction
  final String title;

  /// Indicates the type of the transaction
  final TransactionTypes type;

  /// Action of the transaction
  ///
  /// True if is expense, false if is income
  final bool isExpense;

  /// True if the transaction is approved, false if is pending
  final bool isApproved;

  /// Adds a reference for the category that the transaction belongs to
  final int categoryId;

  /// Adds a reference for the account report that the transaction belongs to
  final int accountReportId;

  /// Adds a reference for the life span that the transaction belongs to
  ///
  /// This is used for recurring transactions, null for other transaction types
  final int? lifeSpanId;

  /// Description of the transaction
  final String? description;
  const TransactionTableData(
      {required this.id,
      required this.amount,
      required this.paymentDate,
      required this.title,
      required this.type,
      required this.isExpense,
      required this.isApproved,
      required this.categoryId,
      required this.accountReportId,
      this.lifeSpanId,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['title'] = Variable<String>(title);
    {
      map['type'] =
          Variable<int>($TransactionTableTable.$convertertype.toSql(type));
    }
    map['is_expense'] = Variable<bool>(isExpense);
    map['is_approved'] = Variable<bool>(isApproved);
    map['category_id'] = Variable<int>(categoryId);
    map['account_report_id'] = Variable<int>(accountReportId);
    if (!nullToAbsent || lifeSpanId != null) {
      map['life_span_id'] = Variable<int>(lifeSpanId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TransactionTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionTableCompanion(
      id: Value(id),
      amount: Value(amount),
      paymentDate: Value(paymentDate),
      title: Value(title),
      type: Value(type),
      isExpense: Value(isExpense),
      isApproved: Value(isApproved),
      categoryId: Value(categoryId),
      accountReportId: Value(accountReportId),
      lifeSpanId: lifeSpanId == null && nullToAbsent
          ? const Value.absent()
          : Value(lifeSpanId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TransactionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionTableData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      title: serializer.fromJson<String>(json['title']),
      type: $TransactionTableTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      isExpense: serializer.fromJson<bool>(json['isExpense']),
      isApproved: serializer.fromJson<bool>(json['isApproved']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      accountReportId: serializer.fromJson<int>(json['accountReportId']),
      lifeSpanId: serializer.fromJson<int?>(json['lifeSpanId']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'title': serializer.toJson<String>(title),
      'type': serializer
          .toJson<int>($TransactionTableTable.$convertertype.toJson(type)),
      'isExpense': serializer.toJson<bool>(isExpense),
      'isApproved': serializer.toJson<bool>(isApproved),
      'categoryId': serializer.toJson<int>(categoryId),
      'accountReportId': serializer.toJson<int>(accountReportId),
      'lifeSpanId': serializer.toJson<int?>(lifeSpanId),
      'description': serializer.toJson<String?>(description),
    };
  }

  TransactionTableData copyWith(
          {int? id,
          double? amount,
          DateTime? paymentDate,
          String? title,
          TransactionTypes? type,
          bool? isExpense,
          bool? isApproved,
          int? categoryId,
          int? accountReportId,
          Value<int?> lifeSpanId = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      TransactionTableData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        paymentDate: paymentDate ?? this.paymentDate,
        title: title ?? this.title,
        type: type ?? this.type,
        isExpense: isExpense ?? this.isExpense,
        isApproved: isApproved ?? this.isApproved,
        categoryId: categoryId ?? this.categoryId,
        accountReportId: accountReportId ?? this.accountReportId,
        lifeSpanId: lifeSpanId.present ? lifeSpanId.value : this.lifeSpanId,
        description: description.present ? description.value : this.description,
      );
  TransactionTableData copyWithCompanion(TransactionTableCompanion data) {
    return TransactionTableData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      isExpense: data.isExpense.present ? data.isExpense.value : this.isExpense,
      isApproved:
          data.isApproved.present ? data.isApproved.value : this.isApproved,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      accountReportId: data.accountReportId.present
          ? data.accountReportId.value
          : this.accountReportId,
      lifeSpanId:
          data.lifeSpanId.present ? data.lifeSpanId.value : this.lifeSpanId,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('isExpense: $isExpense, ')
          ..write('isApproved: $isApproved, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountReportId: $accountReportId, ')
          ..write('lifeSpanId: $lifeSpanId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      amount,
      paymentDate,
      title,
      type,
      isExpense,
      isApproved,
      categoryId,
      accountReportId,
      lifeSpanId,
      description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionTableData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.paymentDate == this.paymentDate &&
          other.title == this.title &&
          other.type == this.type &&
          other.isExpense == this.isExpense &&
          other.isApproved == this.isApproved &&
          other.categoryId == this.categoryId &&
          other.accountReportId == this.accountReportId &&
          other.lifeSpanId == this.lifeSpanId &&
          other.description == this.description);
}

class TransactionTableCompanion extends UpdateCompanion<TransactionTableData> {
  final Value<int> id;
  final Value<double> amount;
  final Value<DateTime> paymentDate;
  final Value<String> title;
  final Value<TransactionTypes> type;
  final Value<bool> isExpense;
  final Value<bool> isApproved;
  final Value<int> categoryId;
  final Value<int> accountReportId;
  final Value<int?> lifeSpanId;
  final Value<String?> description;
  const TransactionTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.isExpense = const Value.absent(),
    this.isApproved = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.accountReportId = const Value.absent(),
    this.lifeSpanId = const Value.absent(),
    this.description = const Value.absent(),
  });
  TransactionTableCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required DateTime paymentDate,
    required String title,
    required TransactionTypes type,
    required bool isExpense,
    required bool isApproved,
    required int categoryId,
    required int accountReportId,
    this.lifeSpanId = const Value.absent(),
    this.description = const Value.absent(),
  })  : amount = Value(amount),
        paymentDate = Value(paymentDate),
        title = Value(title),
        type = Value(type),
        isExpense = Value(isExpense),
        isApproved = Value(isApproved),
        categoryId = Value(categoryId),
        accountReportId = Value(accountReportId);
  static Insertable<TransactionTableData> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<DateTime>? paymentDate,
    Expression<String>? title,
    Expression<int>? type,
    Expression<bool>? isExpense,
    Expression<bool>? isApproved,
    Expression<int>? categoryId,
    Expression<int>? accountReportId,
    Expression<int>? lifeSpanId,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (isExpense != null) 'is_expense': isExpense,
      if (isApproved != null) 'is_approved': isApproved,
      if (categoryId != null) 'category_id': categoryId,
      if (accountReportId != null) 'account_report_id': accountReportId,
      if (lifeSpanId != null) 'life_span_id': lifeSpanId,
      if (description != null) 'description': description,
    });
  }

  TransactionTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<DateTime>? paymentDate,
      Value<String>? title,
      Value<TransactionTypes>? type,
      Value<bool>? isExpense,
      Value<bool>? isApproved,
      Value<int>? categoryId,
      Value<int>? accountReportId,
      Value<int?>? lifeSpanId,
      Value<String?>? description}) {
    return TransactionTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      title: title ?? this.title,
      type: type ?? this.type,
      isExpense: isExpense ?? this.isExpense,
      isApproved: isApproved ?? this.isApproved,
      categoryId: categoryId ?? this.categoryId,
      accountReportId: accountReportId ?? this.accountReportId,
      lifeSpanId: lifeSpanId ?? this.lifeSpanId,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
          $TransactionTableTable.$convertertype.toSql(type.value));
    }
    if (isExpense.present) {
      map['is_expense'] = Variable<bool>(isExpense.value);
    }
    if (isApproved.present) {
      map['is_approved'] = Variable<bool>(isApproved.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (accountReportId.present) {
      map['account_report_id'] = Variable<int>(accountReportId.value);
    }
    if (lifeSpanId.present) {
      map['life_span_id'] = Variable<int>(lifeSpanId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('isExpense: $isExpense, ')
          ..write('isApproved: $isApproved, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountReportId: $accountReportId, ')
          ..write('lifeSpanId: $lifeSpanId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $AppNotificationTableTable extends AppNotificationTable
    with TableInfo<$AppNotificationTableTable, AppNotificationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppNotificationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _packageNameMeta =
      const VerificationMeta('packageName');
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
      'package_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<Uint8List> icon = GeneratedColumn<Uint8List>(
      'icon', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _saveNotificationsMeta =
      const VerificationMeta('saveNotifications');
  @override
  late final GeneratedColumn<bool> saveNotifications = GeneratedColumn<bool>(
      'save_notifications', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("save_notifications" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, packageName, icon, saveNotifications];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_notification_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppNotificationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('package_name')) {
      context.handle(
          _packageNameMeta,
          packageName.isAcceptableOrUnknown(
              data['package_name']!, _packageNameMeta));
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('save_notifications')) {
      context.handle(
          _saveNotificationsMeta,
          saveNotifications.isAcceptableOrUnknown(
              data['save_notifications']!, _saveNotificationsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppNotificationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppNotificationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      packageName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}package_name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}icon']),
      saveNotifications: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}save_notifications'])!,
    );
  }

  @override
  $AppNotificationTableTable createAlias(String alias) {
    return $AppNotificationTableTable(attachedDatabase, alias);
  }
}

class AppNotificationTableData extends DataClass
    implements Insertable<AppNotificationTableData> {
  /// Unique identifier for the app
  final int id;

  /// Package name of the application that sent the notification
  final String packageName;

  /// Icon of the application that sent the notification
  final Uint8List? icon;

  /// True if the app must save the notifications of this app
  final bool saveNotifications;
  const AppNotificationTableData(
      {required this.id,
      required this.packageName,
      this.icon,
      required this.saveNotifications});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['package_name'] = Variable<String>(packageName);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<Uint8List>(icon);
    }
    map['save_notifications'] = Variable<bool>(saveNotifications);
    return map;
  }

  AppNotificationTableCompanion toCompanion(bool nullToAbsent) {
    return AppNotificationTableCompanion(
      id: Value(id),
      packageName: Value(packageName),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      saveNotifications: Value(saveNotifications),
    );
  }

  factory AppNotificationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppNotificationTableData(
      id: serializer.fromJson<int>(json['id']),
      packageName: serializer.fromJson<String>(json['packageName']),
      icon: serializer.fromJson<Uint8List?>(json['icon']),
      saveNotifications: serializer.fromJson<bool>(json['saveNotifications']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'packageName': serializer.toJson<String>(packageName),
      'icon': serializer.toJson<Uint8List?>(icon),
      'saveNotifications': serializer.toJson<bool>(saveNotifications),
    };
  }

  AppNotificationTableData copyWith(
          {int? id,
          String? packageName,
          Value<Uint8List?> icon = const Value.absent(),
          bool? saveNotifications}) =>
      AppNotificationTableData(
        id: id ?? this.id,
        packageName: packageName ?? this.packageName,
        icon: icon.present ? icon.value : this.icon,
        saveNotifications: saveNotifications ?? this.saveNotifications,
      );
  AppNotificationTableData copyWithCompanion(
      AppNotificationTableCompanion data) {
    return AppNotificationTableData(
      id: data.id.present ? data.id.value : this.id,
      packageName:
          data.packageName.present ? data.packageName.value : this.packageName,
      icon: data.icon.present ? data.icon.value : this.icon,
      saveNotifications: data.saveNotifications.present
          ? data.saveNotifications.value
          : this.saveNotifications,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppNotificationTableData(')
          ..write('id: $id, ')
          ..write('packageName: $packageName, ')
          ..write('icon: $icon, ')
          ..write('saveNotifications: $saveNotifications')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, packageName, $driftBlobEquality.hash(icon), saveNotifications);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppNotificationTableData &&
          other.id == this.id &&
          other.packageName == this.packageName &&
          $driftBlobEquality.equals(other.icon, this.icon) &&
          other.saveNotifications == this.saveNotifications);
}

class AppNotificationTableCompanion
    extends UpdateCompanion<AppNotificationTableData> {
  final Value<int> id;
  final Value<String> packageName;
  final Value<Uint8List?> icon;
  final Value<bool> saveNotifications;
  const AppNotificationTableCompanion({
    this.id = const Value.absent(),
    this.packageName = const Value.absent(),
    this.icon = const Value.absent(),
    this.saveNotifications = const Value.absent(),
  });
  AppNotificationTableCompanion.insert({
    this.id = const Value.absent(),
    required String packageName,
    this.icon = const Value.absent(),
    this.saveNotifications = const Value.absent(),
  }) : packageName = Value(packageName);
  static Insertable<AppNotificationTableData> custom({
    Expression<int>? id,
    Expression<String>? packageName,
    Expression<Uint8List>? icon,
    Expression<bool>? saveNotifications,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageName != null) 'package_name': packageName,
      if (icon != null) 'icon': icon,
      if (saveNotifications != null) 'save_notifications': saveNotifications,
    });
  }

  AppNotificationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? packageName,
      Value<Uint8List?>? icon,
      Value<bool>? saveNotifications}) {
    return AppNotificationTableCompanion(
      id: id ?? this.id,
      packageName: packageName ?? this.packageName,
      icon: icon ?? this.icon,
      saveNotifications: saveNotifications ?? this.saveNotifications,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (icon.present) {
      map['icon'] = Variable<Uint8List>(icon.value);
    }
    if (saveNotifications.present) {
      map['save_notifications'] = Variable<bool>(saveNotifications.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppNotificationTableCompanion(')
          ..write('id: $id, ')
          ..write('packageName: $packageName, ')
          ..write('icon: $icon, ')
          ..write('saveNotifications: $saveNotifications')
          ..write(')'))
        .toString();
  }
}

class $AppRegexTableTable extends AppRegexTable
    with TableInfo<$AppRegexTableTable, AppRegexTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppRegexTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isPurchaseMeta =
      const VerificationMeta('isPurchase');
  @override
  late final GeneratedColumn<bool> isPurchase = GeneratedColumn<bool>(
      'is_purchase', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_purchase" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _appIdMeta = const VerificationMeta('appId');
  @override
  late final GeneratedColumn<int> appId = GeneratedColumn<int>(
      'app_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES app_notification_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, isPurchase, appId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_regex_table';
  @override
  VerificationContext validateIntegrity(Insertable<AppRegexTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_purchase')) {
      context.handle(
          _isPurchaseMeta,
          isPurchase.isAcceptableOrUnknown(
              data['is_purchase']!, _isPurchaseMeta));
    }
    if (data.containsKey('app_id')) {
      context.handle(
          _appIdMeta, appId.isAcceptableOrUnknown(data['app_id']!, _appIdMeta));
    } else if (isInserting) {
      context.missing(_appIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppRegexTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppRegexTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isPurchase: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_purchase'])!,
      appId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}app_id'])!,
    );
  }

  @override
  $AppRegexTableTable createAlias(String alias) {
    return $AppRegexTableTable(attachedDatabase, alias);
  }
}

class AppRegexTableData extends DataClass
    implements Insertable<AppRegexTableData> {
  /// Unique identifier for the notification
  final int id;

  /// True if the regex is used for purchases
  /// False if the regex is used for incomes
  final bool isPurchase;

  /// Adds a reference for the app that this regex belongs to
  final int appId;
  const AppRegexTableData(
      {required this.id, required this.isPurchase, required this.appId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_purchase'] = Variable<bool>(isPurchase);
    map['app_id'] = Variable<int>(appId);
    return map;
  }

  AppRegexTableCompanion toCompanion(bool nullToAbsent) {
    return AppRegexTableCompanion(
      id: Value(id),
      isPurchase: Value(isPurchase),
      appId: Value(appId),
    );
  }

  factory AppRegexTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppRegexTableData(
      id: serializer.fromJson<int>(json['id']),
      isPurchase: serializer.fromJson<bool>(json['isPurchase']),
      appId: serializer.fromJson<int>(json['appId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isPurchase': serializer.toJson<bool>(isPurchase),
      'appId': serializer.toJson<int>(appId),
    };
  }

  AppRegexTableData copyWith({int? id, bool? isPurchase, int? appId}) =>
      AppRegexTableData(
        id: id ?? this.id,
        isPurchase: isPurchase ?? this.isPurchase,
        appId: appId ?? this.appId,
      );
  AppRegexTableData copyWithCompanion(AppRegexTableCompanion data) {
    return AppRegexTableData(
      id: data.id.present ? data.id.value : this.id,
      isPurchase:
          data.isPurchase.present ? data.isPurchase.value : this.isPurchase,
      appId: data.appId.present ? data.appId.value : this.appId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppRegexTableData(')
          ..write('id: $id, ')
          ..write('isPurchase: $isPurchase, ')
          ..write('appId: $appId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isPurchase, appId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppRegexTableData &&
          other.id == this.id &&
          other.isPurchase == this.isPurchase &&
          other.appId == this.appId);
}

class AppRegexTableCompanion extends UpdateCompanion<AppRegexTableData> {
  final Value<int> id;
  final Value<bool> isPurchase;
  final Value<int> appId;
  const AppRegexTableCompanion({
    this.id = const Value.absent(),
    this.isPurchase = const Value.absent(),
    this.appId = const Value.absent(),
  });
  AppRegexTableCompanion.insert({
    this.id = const Value.absent(),
    this.isPurchase = const Value.absent(),
    required int appId,
  }) : appId = Value(appId);
  static Insertable<AppRegexTableData> custom({
    Expression<int>? id,
    Expression<bool>? isPurchase,
    Expression<int>? appId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isPurchase != null) 'is_purchase': isPurchase,
      if (appId != null) 'app_id': appId,
    });
  }

  AppRegexTableCompanion copyWith(
      {Value<int>? id, Value<bool>? isPurchase, Value<int>? appId}) {
    return AppRegexTableCompanion(
      id: id ?? this.id,
      isPurchase: isPurchase ?? this.isPurchase,
      appId: appId ?? this.appId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isPurchase.present) {
      map['is_purchase'] = Variable<bool>(isPurchase.value);
    }
    if (appId.present) {
      map['app_id'] = Variable<int>(appId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppRegexTableCompanion(')
          ..write('id: $id, ')
          ..write('isPurchase: $isPurchase, ')
          ..write('appId: $appId')
          ..write(')'))
        .toString();
  }
}

class $RegexValuesTableTable extends RegexValuesTable
    with TableInfo<$RegexValuesTableTable, RegexValuesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegexValuesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleRegexMeta =
      const VerificationMeta('titleRegex');
  @override
  late final GeneratedColumn<String> titleRegex = GeneratedColumn<String>(
      'title_regex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _triggerTextMeta =
      const VerificationMeta('triggerText');
  @override
  late final GeneratedColumn<String> triggerText = GeneratedColumn<String>(
      'trigger_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountRegexMeta =
      const VerificationMeta('amountRegex');
  @override
  late final GeneratedColumn<String> amountRegex = GeneratedColumn<String>(
      'amount_regex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _merchantRegexMeta =
      const VerificationMeta('merchantRegex');
  @override
  late final GeneratedColumn<String> merchantRegex = GeneratedColumn<String>(
      'merchant_regex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _regexInfoMeta =
      const VerificationMeta('regexInfo');
  @override
  late final GeneratedColumn<int> regexInfo = GeneratedColumn<int>(
      'regex_info', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES app_regex_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, titleRegex, triggerText, amountRegex, merchantRegex, regexInfo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'regex_values_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RegexValuesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title_regex')) {
      context.handle(
          _titleRegexMeta,
          titleRegex.isAcceptableOrUnknown(
              data['title_regex']!, _titleRegexMeta));
    }
    if (data.containsKey('trigger_text')) {
      context.handle(
          _triggerTextMeta,
          triggerText.isAcceptableOrUnknown(
              data['trigger_text']!, _triggerTextMeta));
    }
    if (data.containsKey('amount_regex')) {
      context.handle(
          _amountRegexMeta,
          amountRegex.isAcceptableOrUnknown(
              data['amount_regex']!, _amountRegexMeta));
    }
    if (data.containsKey('merchant_regex')) {
      context.handle(
          _merchantRegexMeta,
          merchantRegex.isAcceptableOrUnknown(
              data['merchant_regex']!, _merchantRegexMeta));
    }
    if (data.containsKey('regex_info')) {
      context.handle(_regexInfoMeta,
          regexInfo.isAcceptableOrUnknown(data['regex_info']!, _regexInfoMeta));
    } else if (isInserting) {
      context.missing(_regexInfoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegexValuesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegexValuesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      titleRegex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title_regex']),
      triggerText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trigger_text']),
      amountRegex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount_regex']),
      merchantRegex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_regex']),
      regexInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}regex_info'])!,
    );
  }

  @override
  $RegexValuesTableTable createAlias(String alias) {
    return $RegexValuesTableTable(attachedDatabase, alias);
  }
}

class RegexValuesTableData extends DataClass
    implements Insertable<RegexValuesTableData> {
  /// Unique identifier for the notification
  final int id;

  /// Title for the notification
  final String? titleRegex;

  /// Trigger word for the regex search
  final String? triggerText;

  /// Regex to extract the amount from the notification
  final String? amountRegex;

  /// Regex to extract the merchant from the notification
  final String? merchantRegex;

  /// Adds a reference for the regex info that this values belongs to
  final int regexInfo;
  const RegexValuesTableData(
      {required this.id,
      this.titleRegex,
      this.triggerText,
      this.amountRegex,
      this.merchantRegex,
      required this.regexInfo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || titleRegex != null) {
      map['title_regex'] = Variable<String>(titleRegex);
    }
    if (!nullToAbsent || triggerText != null) {
      map['trigger_text'] = Variable<String>(triggerText);
    }
    if (!nullToAbsent || amountRegex != null) {
      map['amount_regex'] = Variable<String>(amountRegex);
    }
    if (!nullToAbsent || merchantRegex != null) {
      map['merchant_regex'] = Variable<String>(merchantRegex);
    }
    map['regex_info'] = Variable<int>(regexInfo);
    return map;
  }

  RegexValuesTableCompanion toCompanion(bool nullToAbsent) {
    return RegexValuesTableCompanion(
      id: Value(id),
      titleRegex: titleRegex == null && nullToAbsent
          ? const Value.absent()
          : Value(titleRegex),
      triggerText: triggerText == null && nullToAbsent
          ? const Value.absent()
          : Value(triggerText),
      amountRegex: amountRegex == null && nullToAbsent
          ? const Value.absent()
          : Value(amountRegex),
      merchantRegex: merchantRegex == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantRegex),
      regexInfo: Value(regexInfo),
    );
  }

  factory RegexValuesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegexValuesTableData(
      id: serializer.fromJson<int>(json['id']),
      titleRegex: serializer.fromJson<String?>(json['titleRegex']),
      triggerText: serializer.fromJson<String?>(json['triggerText']),
      amountRegex: serializer.fromJson<String?>(json['amountRegex']),
      merchantRegex: serializer.fromJson<String?>(json['merchantRegex']),
      regexInfo: serializer.fromJson<int>(json['regexInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titleRegex': serializer.toJson<String?>(titleRegex),
      'triggerText': serializer.toJson<String?>(triggerText),
      'amountRegex': serializer.toJson<String?>(amountRegex),
      'merchantRegex': serializer.toJson<String?>(merchantRegex),
      'regexInfo': serializer.toJson<int>(regexInfo),
    };
  }

  RegexValuesTableData copyWith(
          {int? id,
          Value<String?> titleRegex = const Value.absent(),
          Value<String?> triggerText = const Value.absent(),
          Value<String?> amountRegex = const Value.absent(),
          Value<String?> merchantRegex = const Value.absent(),
          int? regexInfo}) =>
      RegexValuesTableData(
        id: id ?? this.id,
        titleRegex: titleRegex.present ? titleRegex.value : this.titleRegex,
        triggerText: triggerText.present ? triggerText.value : this.triggerText,
        amountRegex: amountRegex.present ? amountRegex.value : this.amountRegex,
        merchantRegex:
            merchantRegex.present ? merchantRegex.value : this.merchantRegex,
        regexInfo: regexInfo ?? this.regexInfo,
      );
  RegexValuesTableData copyWithCompanion(RegexValuesTableCompanion data) {
    return RegexValuesTableData(
      id: data.id.present ? data.id.value : this.id,
      titleRegex:
          data.titleRegex.present ? data.titleRegex.value : this.titleRegex,
      triggerText:
          data.triggerText.present ? data.triggerText.value : this.triggerText,
      amountRegex:
          data.amountRegex.present ? data.amountRegex.value : this.amountRegex,
      merchantRegex: data.merchantRegex.present
          ? data.merchantRegex.value
          : this.merchantRegex,
      regexInfo: data.regexInfo.present ? data.regexInfo.value : this.regexInfo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegexValuesTableData(')
          ..write('id: $id, ')
          ..write('titleRegex: $titleRegex, ')
          ..write('triggerText: $triggerText, ')
          ..write('amountRegex: $amountRegex, ')
          ..write('merchantRegex: $merchantRegex, ')
          ..write('regexInfo: $regexInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, titleRegex, triggerText, amountRegex, merchantRegex, regexInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegexValuesTableData &&
          other.id == this.id &&
          other.titleRegex == this.titleRegex &&
          other.triggerText == this.triggerText &&
          other.amountRegex == this.amountRegex &&
          other.merchantRegex == this.merchantRegex &&
          other.regexInfo == this.regexInfo);
}

class RegexValuesTableCompanion extends UpdateCompanion<RegexValuesTableData> {
  final Value<int> id;
  final Value<String?> titleRegex;
  final Value<String?> triggerText;
  final Value<String?> amountRegex;
  final Value<String?> merchantRegex;
  final Value<int> regexInfo;
  const RegexValuesTableCompanion({
    this.id = const Value.absent(),
    this.titleRegex = const Value.absent(),
    this.triggerText = const Value.absent(),
    this.amountRegex = const Value.absent(),
    this.merchantRegex = const Value.absent(),
    this.regexInfo = const Value.absent(),
  });
  RegexValuesTableCompanion.insert({
    this.id = const Value.absent(),
    this.titleRegex = const Value.absent(),
    this.triggerText = const Value.absent(),
    this.amountRegex = const Value.absent(),
    this.merchantRegex = const Value.absent(),
    required int regexInfo,
  }) : regexInfo = Value(regexInfo);
  static Insertable<RegexValuesTableData> custom({
    Expression<int>? id,
    Expression<String>? titleRegex,
    Expression<String>? triggerText,
    Expression<String>? amountRegex,
    Expression<String>? merchantRegex,
    Expression<int>? regexInfo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titleRegex != null) 'title_regex': titleRegex,
      if (triggerText != null) 'trigger_text': triggerText,
      if (amountRegex != null) 'amount_regex': amountRegex,
      if (merchantRegex != null) 'merchant_regex': merchantRegex,
      if (regexInfo != null) 'regex_info': regexInfo,
    });
  }

  RegexValuesTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? titleRegex,
      Value<String?>? triggerText,
      Value<String?>? amountRegex,
      Value<String?>? merchantRegex,
      Value<int>? regexInfo}) {
    return RegexValuesTableCompanion(
      id: id ?? this.id,
      titleRegex: titleRegex ?? this.titleRegex,
      triggerText: triggerText ?? this.triggerText,
      amountRegex: amountRegex ?? this.amountRegex,
      merchantRegex: merchantRegex ?? this.merchantRegex,
      regexInfo: regexInfo ?? this.regexInfo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titleRegex.present) {
      map['title_regex'] = Variable<String>(titleRegex.value);
    }
    if (triggerText.present) {
      map['trigger_text'] = Variable<String>(triggerText.value);
    }
    if (amountRegex.present) {
      map['amount_regex'] = Variable<String>(amountRegex.value);
    }
    if (merchantRegex.present) {
      map['merchant_regex'] = Variable<String>(merchantRegex.value);
    }
    if (regexInfo.present) {
      map['regex_info'] = Variable<int>(regexInfo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegexValuesTableCompanion(')
          ..write('id: $id, ')
          ..write('titleRegex: $titleRegex, ')
          ..write('triggerText: $triggerText, ')
          ..write('amountRegex: $amountRegex, ')
          ..write('merchantRegex: $merchantRegex, ')
          ..write('regexInfo: $regexInfo')
          ..write(')'))
        .toString();
  }
}

class $NotificationTableTable extends NotificationTable
    with TableInfo<$NotificationTableTable, NotificationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _appIdMeta = const VerificationMeta('appId');
  @override
  late final GeneratedColumn<int> appId = GeneratedColumn<int>(
      'app_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES app_notification_table (id)'));
  static const VerificationMeta _hasRegexMatchMeta =
      const VerificationMeta('hasRegexMatch');
  @override
  late final GeneratedColumn<bool> hasRegexMatch = GeneratedColumn<bool>(
      'has_regex_match', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_regex_match" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _infoTextMeta =
      const VerificationMeta('infoText');
  @override
  late final GeneratedColumn<String> infoText = GeneratedColumn<String>(
      'info_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bigTextMeta =
      const VerificationMeta('bigText');
  @override
  late final GeneratedColumn<String> bigText = GeneratedColumn<String>(
      'big_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subTextMeta =
      const VerificationMeta('subText');
  @override
  late final GeneratedColumn<String> subText = GeneratedColumn<String>(
      'sub_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        time,
        appId,
        hasRegexMatch,
        infoText,
        bigText,
        subText
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('app_id')) {
      context.handle(
          _appIdMeta, appId.isAcceptableOrUnknown(data['app_id']!, _appIdMeta));
    } else if (isInserting) {
      context.missing(_appIdMeta);
    }
    if (data.containsKey('has_regex_match')) {
      context.handle(
          _hasRegexMatchMeta,
          hasRegexMatch.isAcceptableOrUnknown(
              data['has_regex_match']!, _hasRegexMatchMeta));
    }
    if (data.containsKey('info_text')) {
      context.handle(_infoTextMeta,
          infoText.isAcceptableOrUnknown(data['info_text']!, _infoTextMeta));
    }
    if (data.containsKey('big_text')) {
      context.handle(_bigTextMeta,
          bigText.isAcceptableOrUnknown(data['big_text']!, _bigTextMeta));
    }
    if (data.containsKey('sub_text')) {
      context.handle(_subTextMeta,
          subText.isAcceptableOrUnknown(data['sub_text']!, _subTextMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      appId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}app_id'])!,
      hasRegexMatch: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_regex_match'])!,
      infoText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}info_text']),
      bigText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}big_text']),
      subText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_text']),
    );
  }

  @override
  $NotificationTableTable createAlias(String alias) {
    return $NotificationTableTable(attachedDatabase, alias);
  }
}

class NotificationTableData extends DataClass
    implements Insertable<NotificationTableData> {
  /// Unique identifier for the notification
  final int id;

  /// Title of the notification
  final String title;

  /// Description of the notification
  final String description;

  /// Time when the notification was received
  final DateTime time;

  /// Adds a reference for the app that the notification belongs to
  final int appId;

  /// True if the notification matches a regex
  final bool hasRegexMatch;

  /// Info text of the notification
  final String? infoText;

  /// Big text of the notification
  final String? bigText;

  /// Sub text of the notification
  final String? subText;
  const NotificationTableData(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.appId,
      required this.hasRegexMatch,
      this.infoText,
      this.bigText,
      this.subText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['time'] = Variable<DateTime>(time);
    map['app_id'] = Variable<int>(appId);
    map['has_regex_match'] = Variable<bool>(hasRegexMatch);
    if (!nullToAbsent || infoText != null) {
      map['info_text'] = Variable<String>(infoText);
    }
    if (!nullToAbsent || bigText != null) {
      map['big_text'] = Variable<String>(bigText);
    }
    if (!nullToAbsent || subText != null) {
      map['sub_text'] = Variable<String>(subText);
    }
    return map;
  }

  NotificationTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      time: Value(time),
      appId: Value(appId),
      hasRegexMatch: Value(hasRegexMatch),
      infoText: infoText == null && nullToAbsent
          ? const Value.absent()
          : Value(infoText),
      bigText: bigText == null && nullToAbsent
          ? const Value.absent()
          : Value(bigText),
      subText: subText == null && nullToAbsent
          ? const Value.absent()
          : Value(subText),
    );
  }

  factory NotificationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      time: serializer.fromJson<DateTime>(json['time']),
      appId: serializer.fromJson<int>(json['appId']),
      hasRegexMatch: serializer.fromJson<bool>(json['hasRegexMatch']),
      infoText: serializer.fromJson<String?>(json['infoText']),
      bigText: serializer.fromJson<String?>(json['bigText']),
      subText: serializer.fromJson<String?>(json['subText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'time': serializer.toJson<DateTime>(time),
      'appId': serializer.toJson<int>(appId),
      'hasRegexMatch': serializer.toJson<bool>(hasRegexMatch),
      'infoText': serializer.toJson<String?>(infoText),
      'bigText': serializer.toJson<String?>(bigText),
      'subText': serializer.toJson<String?>(subText),
    };
  }

  NotificationTableData copyWith(
          {int? id,
          String? title,
          String? description,
          DateTime? time,
          int? appId,
          bool? hasRegexMatch,
          Value<String?> infoText = const Value.absent(),
          Value<String?> bigText = const Value.absent(),
          Value<String?> subText = const Value.absent()}) =>
      NotificationTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        time: time ?? this.time,
        appId: appId ?? this.appId,
        hasRegexMatch: hasRegexMatch ?? this.hasRegexMatch,
        infoText: infoText.present ? infoText.value : this.infoText,
        bigText: bigText.present ? bigText.value : this.bigText,
        subText: subText.present ? subText.value : this.subText,
      );
  NotificationTableData copyWithCompanion(NotificationTableCompanion data) {
    return NotificationTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      time: data.time.present ? data.time.value : this.time,
      appId: data.appId.present ? data.appId.value : this.appId,
      hasRegexMatch: data.hasRegexMatch.present
          ? data.hasRegexMatch.value
          : this.hasRegexMatch,
      infoText: data.infoText.present ? data.infoText.value : this.infoText,
      bigText: data.bigText.present ? data.bigText.value : this.bigText,
      subText: data.subText.present ? data.subText.value : this.subText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('time: $time, ')
          ..write('appId: $appId, ')
          ..write('hasRegexMatch: $hasRegexMatch, ')
          ..write('infoText: $infoText, ')
          ..write('bigText: $bigText, ')
          ..write('subText: $subText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, time, appId,
      hasRegexMatch, infoText, bigText, subText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.time == this.time &&
          other.appId == this.appId &&
          other.hasRegexMatch == this.hasRegexMatch &&
          other.infoText == this.infoText &&
          other.bigText == this.bigText &&
          other.subText == this.subText);
}

class NotificationTableCompanion
    extends UpdateCompanion<NotificationTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> time;
  final Value<int> appId;
  final Value<bool> hasRegexMatch;
  final Value<String?> infoText;
  final Value<String?> bigText;
  final Value<String?> subText;
  const NotificationTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.time = const Value.absent(),
    this.appId = const Value.absent(),
    this.hasRegexMatch = const Value.absent(),
    this.infoText = const Value.absent(),
    this.bigText = const Value.absent(),
    this.subText = const Value.absent(),
  });
  NotificationTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required DateTime time,
    required int appId,
    this.hasRegexMatch = const Value.absent(),
    this.infoText = const Value.absent(),
    this.bigText = const Value.absent(),
    this.subText = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        time = Value(time),
        appId = Value(appId);
  static Insertable<NotificationTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? time,
    Expression<int>? appId,
    Expression<bool>? hasRegexMatch,
    Expression<String>? infoText,
    Expression<String>? bigText,
    Expression<String>? subText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (time != null) 'time': time,
      if (appId != null) 'app_id': appId,
      if (hasRegexMatch != null) 'has_regex_match': hasRegexMatch,
      if (infoText != null) 'info_text': infoText,
      if (bigText != null) 'big_text': bigText,
      if (subText != null) 'sub_text': subText,
    });
  }

  NotificationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime>? time,
      Value<int>? appId,
      Value<bool>? hasRegexMatch,
      Value<String?>? infoText,
      Value<String?>? bigText,
      Value<String?>? subText}) {
    return NotificationTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      appId: appId ?? this.appId,
      hasRegexMatch: hasRegexMatch ?? this.hasRegexMatch,
      infoText: infoText ?? this.infoText,
      bigText: bigText ?? this.bigText,
      subText: subText ?? this.subText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (appId.present) {
      map['app_id'] = Variable<int>(appId.value);
    }
    if (hasRegexMatch.present) {
      map['has_regex_match'] = Variable<bool>(hasRegexMatch.value);
    }
    if (infoText.present) {
      map['info_text'] = Variable<String>(infoText.value);
    }
    if (bigText.present) {
      map['big_text'] = Variable<String>(bigText.value);
    }
    if (subText.present) {
      map['sub_text'] = Variable<String>(subText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('time: $time, ')
          ..write('appId: $appId, ')
          ..write('hasRegexMatch: $hasRegexMatch, ')
          ..write('infoText: $infoText, ')
          ..write('bigText: $bigText, ')
          ..write('subText: $subText')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BankTableTable bankTable = $BankTableTable(this);
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $LifeSpanTableTable lifeSpanTable = $LifeSpanTableTable(this);
  late final $AccountReportTableTable accountReportTable =
      $AccountReportTableTable(this);
  late final $TransactionTableTable transactionTable =
      $TransactionTableTable(this);
  late final $AppNotificationTableTable appNotificationTable =
      $AppNotificationTableTable(this);
  late final $AppRegexTableTable appRegexTable = $AppRegexTableTable(this);
  late final $RegexValuesTableTable regexValuesTable =
      $RegexValuesTableTable(this);
  late final $NotificationTableTable notificationTable =
      $NotificationTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        bankTable,
        accountTable,
        categoryTable,
        lifeSpanTable,
        accountReportTable,
        transactionTable,
        appNotificationTable,
        appRegexTable,
        regexValuesTable,
        notificationTable
      ];
}

typedef $$BankTableTableCreateCompanionBuilder = BankTableCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  Value<String?> logo,
  Value<String?> url,
  Value<String?> description,
});
typedef $$BankTableTableUpdateCompanionBuilder = BankTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<String?> logo,
  Value<String?> url,
  Value<String?> description,
});

final class $$BankTableTableReferences
    extends BaseReferences<_$AppDatabase, $BankTableTable, BankTableData> {
  $$BankTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountTableTable, List<AccountTableData>>
      _accountTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.accountTable,
          aliasName:
              $_aliasNameGenerator(db.bankTable.id, db.accountTable.bankId));

  $$AccountTableTableProcessedTableManager get accountTableRefs {
    final manager = $$AccountTableTableTableManager($_db, $_db.accountTable)
        .filter((f) => f.bankId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_accountTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BankTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BankTableTable> {
  $$BankTableTableFilterComposer(super.$state);
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

  ComposableFilter accountTableRefs(
      ComposableFilter Function($$AccountTableTableFilterComposer f) f) {
    final $$AccountTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.accountTable,
        getReferencedColumn: (t) => t.bankId,
        builder: (joinBuilder, parentComposers) =>
            $$AccountTableTableFilterComposer(ComposerState($state.db,
                $state.db.accountTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$BankTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BankTableTable> {
  $$BankTableTableOrderingComposer(super.$state);
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

class $$BankTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankTableTable,
    BankTableData,
    $$BankTableTableFilterComposer,
    $$BankTableTableOrderingComposer,
    $$BankTableTableCreateCompanionBuilder,
    $$BankTableTableUpdateCompanionBuilder,
    (BankTableData, $$BankTableTableReferences),
    BankTableData,
    PrefetchHooks Function({bool accountTableRefs})> {
  $$BankTableTableTableManager(_$AppDatabase db, $BankTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BankTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BankTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              BankTableCompanion(
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
              BankTableCompanion.insert(
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
                    $$BankTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({accountTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountTableRefs) db.accountTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$BankTableTableReferences
                            ._accountTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BankTableTableReferences(db, table, p0)
                                .accountTableRefs,
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

typedef $$BankTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BankTableTable,
    BankTableData,
    $$BankTableTableFilterComposer,
    $$BankTableTableOrderingComposer,
    $$BankTableTableCreateCompanionBuilder,
    $$BankTableTableUpdateCompanionBuilder,
    (BankTableData, $$BankTableTableReferences),
    BankTableData,
    PrefetchHooks Function({bool accountTableRefs})>;
typedef $$AccountTableTableCreateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  Value<AccountType> type,
  required String currency,
  Value<int?> bankId,
});
typedef $$AccountTableTableUpdateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<AccountType> type,
  Value<String> currency,
  Value<int?> bankId,
});

final class $$AccountTableTableReferences extends BaseReferences<_$AppDatabase,
    $AccountTableTable, AccountTableData> {
  $$AccountTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BankTableTable _bankIdTable(_$AppDatabase db) =>
      db.bankTable.createAlias(
          $_aliasNameGenerator(db.accountTable.bankId, db.bankTable.id));

  $$BankTableTableProcessedTableManager? get bankId {
    if ($_item.bankId == null) return null;
    final manager = $$BankTableTableTableManager($_db, $_db.bankTable)
        .filter((f) => f.id($_item.bankId!));
    final item = $_typedResult.readTableOrNull(_bankIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AccountReportTableTable,
      List<AccountReportTableData>> _accountReportTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.accountReportTable,
          aliasName: $_aliasNameGenerator(
              db.accountTable.id, db.accountReportTable.accountId));

  $$AccountReportTableTableProcessedTableManager get accountReportTableRefs {
    final manager =
        $$AccountReportTableTableTableManager($_db, $_db.accountReportTable)
            .filter((f) => f.accountId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_accountReportTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableFilterComposer(super.$state);
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

  $$BankTableTableFilterComposer get bankId {
    final $$BankTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $state.db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BankTableTableFilterComposer(ComposerState(
                $state.db, $state.db.bankTable, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter accountReportTableRefs(
      ComposableFilter Function($$AccountReportTableTableFilterComposer f) f) {
    final $$AccountReportTableTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.accountReportTable,
            getReferencedColumn: (t) => t.accountId,
            builder: (joinBuilder, parentComposers) =>
                $$AccountReportTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.accountReportTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$AccountTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableOrderingComposer(super.$state);
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

  $$BankTableTableOrderingComposer get bankId {
    final $$BankTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $state.db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BankTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.bankTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AccountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountTableTable,
    AccountTableData,
    $$AccountTableTableFilterComposer,
    $$AccountTableTableOrderingComposer,
    $$AccountTableTableCreateCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder,
    (AccountTableData, $$AccountTableTableReferences),
    AccountTableData,
    PrefetchHooks Function({bool bankId, bool accountReportTableRefs})> {
  $$AccountTableTableTableManager(_$AppDatabase db, $AccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccountTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AccountTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<AccountType> type = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<int?> bankId = const Value.absent(),
          }) =>
              AccountTableCompanion(
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
              AccountTableCompanion.insert(
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
                    $$AccountTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {bankId = false, accountReportTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (accountReportTableRefs) db.accountReportTable
              ],
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
                        $$AccountTableTableReferences._bankIdTable(db),
                    referencedColumn:
                        $$AccountTableTableReferences._bankIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountReportTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AccountTableTableReferences
                            ._accountReportTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountTableTableReferences(db, table, p0)
                                .accountReportTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountTableTable,
    AccountTableData,
    $$AccountTableTableFilterComposer,
    $$AccountTableTableOrderingComposer,
    $$AccountTableTableCreateCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder,
    (AccountTableData, $$AccountTableTableReferences),
    AccountTableData,
    PrefetchHooks Function({bool bankId, bool accountReportTableRefs})>;
typedef $$CategoryTableTableCreateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String color,
  required int icon,
  required bool isExpense,
});
typedef $$CategoryTableTableUpdateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> color,
  Value<int> icon,
  Value<bool> isExpense,
});

final class $$CategoryTableTableReferences extends BaseReferences<_$AppDatabase,
    $CategoryTableTable, CategoryTableData> {
  $$CategoryTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionTableTable, List<TransactionTableData>>
      _transactionTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactionTable,
              aliasName: $_aliasNameGenerator(
                  db.categoryTable.id, db.transactionTable.categoryId));

  $$TransactionTableTableProcessedTableManager get transactionTableRefs {
    final manager =
        $$TransactionTableTableTableManager($_db, $_db.transactionTable)
            .filter((f) => f.categoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoryTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer(super.$state);
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

  ColumnFilters<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isExpense => $state.composableBuilder(
      column: $state.table.isExpense,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter transactionTableRefs(
      ComposableFilter Function($$TransactionTableTableFilterComposer f) f) {
    final $$TransactionTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.transactionTable,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder, parentComposers) =>
                $$TransactionTableTableFilterComposer(ComposerState($state.db,
                    $state.db.transactionTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoryTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer(super.$state);
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

  ColumnOrderings<int> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isExpense => $state.composableBuilder(
      column: $state.table.isExpense,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CategoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (CategoryTableData, $$CategoryTableTableReferences),
    CategoryTableData,
    PrefetchHooks Function({bool transactionTableRefs})> {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoryTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoryTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<int> icon = const Value.absent(),
            Value<bool> isExpense = const Value.absent(),
          }) =>
              CategoryTableCompanion(
            id: id,
            name: name,
            color: color,
            icon: icon,
            isExpense: isExpense,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String color,
            required int icon,
            required bool isExpense,
          }) =>
              CategoryTableCompanion.insert(
            id: id,
            name: name,
            color: color,
            icon: icon,
            isExpense: isExpense,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoryTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({transactionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionTableRefs) db.transactionTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoryTableTableReferences
                            ._transactionTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoryTableTableReferences(db, table, p0)
                                .transactionTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (CategoryTableData, $$CategoryTableTableReferences),
    CategoryTableData,
    PrefetchHooks Function({bool transactionTableRefs})>;
typedef $$LifeSpanTableTableCreateCompanionBuilder = LifeSpanTableCompanion
    Function({
  Value<int> id,
  required LifeSpanUnits unit,
  required int value,
  Value<DateTime?> expirationDate,
});
typedef $$LifeSpanTableTableUpdateCompanionBuilder = LifeSpanTableCompanion
    Function({
  Value<int> id,
  Value<LifeSpanUnits> unit,
  Value<int> value,
  Value<DateTime?> expirationDate,
});

final class $$LifeSpanTableTableReferences extends BaseReferences<_$AppDatabase,
    $LifeSpanTableTable, LifeSpanTableData> {
  $$LifeSpanTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionTableTable, List<TransactionTableData>>
      _transactionTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactionTable,
              aliasName: $_aliasNameGenerator(
                  db.lifeSpanTable.id, db.transactionTable.lifeSpanId));

  $$TransactionTableTableProcessedTableManager get transactionTableRefs {
    final manager =
        $$TransactionTableTableTableManager($_db, $_db.transactionTable)
            .filter((f) => f.lifeSpanId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LifeSpanTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LifeSpanTableTable> {
  $$LifeSpanTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<LifeSpanUnits, LifeSpanUnits, int> get unit =>
      $state.composableBuilder(
          column: $state.table.unit,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get expirationDate => $state.composableBuilder(
      column: $state.table.expirationDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter transactionTableRefs(
      ComposableFilter Function($$TransactionTableTableFilterComposer f) f) {
    final $$TransactionTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.transactionTable,
            getReferencedColumn: (t) => t.lifeSpanId,
            builder: (joinBuilder, parentComposers) =>
                $$TransactionTableTableFilterComposer(ComposerState($state.db,
                    $state.db.transactionTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$LifeSpanTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LifeSpanTableTable> {
  $$LifeSpanTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get expirationDate => $state.composableBuilder(
      column: $state.table.expirationDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$LifeSpanTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LifeSpanTableTable,
    LifeSpanTableData,
    $$LifeSpanTableTableFilterComposer,
    $$LifeSpanTableTableOrderingComposer,
    $$LifeSpanTableTableCreateCompanionBuilder,
    $$LifeSpanTableTableUpdateCompanionBuilder,
    (LifeSpanTableData, $$LifeSpanTableTableReferences),
    LifeSpanTableData,
    PrefetchHooks Function({bool transactionTableRefs})> {
  $$LifeSpanTableTableTableManager(_$AppDatabase db, $LifeSpanTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LifeSpanTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LifeSpanTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<LifeSpanUnits> unit = const Value.absent(),
            Value<int> value = const Value.absent(),
            Value<DateTime?> expirationDate = const Value.absent(),
          }) =>
              LifeSpanTableCompanion(
            id: id,
            unit: unit,
            value: value,
            expirationDate: expirationDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required LifeSpanUnits unit,
            required int value,
            Value<DateTime?> expirationDate = const Value.absent(),
          }) =>
              LifeSpanTableCompanion.insert(
            id: id,
            unit: unit,
            value: value,
            expirationDate: expirationDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LifeSpanTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({transactionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionTableRefs) db.transactionTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$LifeSpanTableTableReferences
                            ._transactionTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LifeSpanTableTableReferences(db, table, p0)
                                .transactionTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.lifeSpanId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LifeSpanTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LifeSpanTableTable,
    LifeSpanTableData,
    $$LifeSpanTableTableFilterComposer,
    $$LifeSpanTableTableOrderingComposer,
    $$LifeSpanTableTableCreateCompanionBuilder,
    $$LifeSpanTableTableUpdateCompanionBuilder,
    (LifeSpanTableData, $$LifeSpanTableTableReferences),
    LifeSpanTableData,
    PrefetchHooks Function({bool transactionTableRefs})>;
typedef $$AccountReportTableTableCreateCompanionBuilder
    = AccountReportTableCompanion Function({
  Value<int> id,
  required double initialMoney,
  required DateTime startDate,
  required DateTime endDate,
  required int accountId,
});
typedef $$AccountReportTableTableUpdateCompanionBuilder
    = AccountReportTableCompanion Function({
  Value<int> id,
  Value<double> initialMoney,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<int> accountId,
});

final class $$AccountReportTableTableReferences extends BaseReferences<
    _$AppDatabase, $AccountReportTableTable, AccountReportTableData> {
  $$AccountReportTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AccountTableTable _accountIdTable(_$AppDatabase db) =>
      db.accountTable.createAlias($_aliasNameGenerator(
          db.accountReportTable.accountId, db.accountTable.id));

  $$AccountTableTableProcessedTableManager? get accountId {
    if ($_item.accountId == null) return null;
    final manager = $$AccountTableTableTableManager($_db, $_db.accountTable)
        .filter((f) => f.id($_item.accountId!));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionTableTable, List<TransactionTableData>>
      _transactionTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactionTable,
              aliasName: $_aliasNameGenerator(db.accountReportTable.id,
                  db.transactionTable.accountReportId));

  $$TransactionTableTableProcessedTableManager get transactionTableRefs {
    final manager =
        $$TransactionTableTableTableManager($_db, $_db.transactionTable)
            .filter((f) => f.accountReportId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountReportTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountReportTableTable> {
  $$AccountReportTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get initialMoney => $state.composableBuilder(
      column: $state.table.initialMoney,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AccountTableTableFilterComposer get accountId {
    final $$AccountTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $state.db.accountTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountTableTableFilterComposer(ComposerState($state.db,
                $state.db.accountTable, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter transactionTableRefs(
      ComposableFilter Function($$TransactionTableTableFilterComposer f) f) {
    final $$TransactionTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.transactionTable,
            getReferencedColumn: (t) => t.accountReportId,
            builder: (joinBuilder, parentComposers) =>
                $$TransactionTableTableFilterComposer(ComposerState($state.db,
                    $state.db.transactionTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$AccountReportTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountReportTableTable> {
  $$AccountReportTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get initialMoney => $state.composableBuilder(
      column: $state.table.initialMoney,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AccountTableTableOrderingComposer get accountId {
    final $$AccountTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $state.db.accountTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountTableTableOrderingComposer(ComposerState($state.db,
                $state.db.accountTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AccountReportTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountReportTableTable,
    AccountReportTableData,
    $$AccountReportTableTableFilterComposer,
    $$AccountReportTableTableOrderingComposer,
    $$AccountReportTableTableCreateCompanionBuilder,
    $$AccountReportTableTableUpdateCompanionBuilder,
    (AccountReportTableData, $$AccountReportTableTableReferences),
    AccountReportTableData,
    PrefetchHooks Function({bool accountId, bool transactionTableRefs})> {
  $$AccountReportTableTableTableManager(
      _$AppDatabase db, $AccountReportTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccountReportTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$AccountReportTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> initialMoney = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<int> accountId = const Value.absent(),
          }) =>
              AccountReportTableCompanion(
            id: id,
            initialMoney: initialMoney,
            startDate: startDate,
            endDate: endDate,
            accountId: accountId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double initialMoney,
            required DateTime startDate,
            required DateTime endDate,
            required int accountId,
          }) =>
              AccountReportTableCompanion.insert(
            id: id,
            initialMoney: initialMoney,
            startDate: startDate,
            endDate: endDate,
            accountId: accountId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AccountReportTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {accountId = false, transactionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionTableRefs) db.transactionTable
              ],
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
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable:
                        $$AccountReportTableTableReferences._accountIdTable(db),
                    referencedColumn: $$AccountReportTableTableReferences
                        ._accountIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AccountReportTableTableReferences
                            ._transactionTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountReportTableTableReferences(db, table, p0)
                                .transactionTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountReportId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountReportTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountReportTableTable,
    AccountReportTableData,
    $$AccountReportTableTableFilterComposer,
    $$AccountReportTableTableOrderingComposer,
    $$AccountReportTableTableCreateCompanionBuilder,
    $$AccountReportTableTableUpdateCompanionBuilder,
    (AccountReportTableData, $$AccountReportTableTableReferences),
    AccountReportTableData,
    PrefetchHooks Function({bool accountId, bool transactionTableRefs})>;
typedef $$TransactionTableTableCreateCompanionBuilder
    = TransactionTableCompanion Function({
  Value<int> id,
  required double amount,
  required DateTime paymentDate,
  required String title,
  required TransactionTypes type,
  required bool isExpense,
  required bool isApproved,
  required int categoryId,
  required int accountReportId,
  Value<int?> lifeSpanId,
  Value<String?> description,
});
typedef $$TransactionTableTableUpdateCompanionBuilder
    = TransactionTableCompanion Function({
  Value<int> id,
  Value<double> amount,
  Value<DateTime> paymentDate,
  Value<String> title,
  Value<TransactionTypes> type,
  Value<bool> isExpense,
  Value<bool> isApproved,
  Value<int> categoryId,
  Value<int> accountReportId,
  Value<int?> lifeSpanId,
  Value<String?> description,
});

final class $$TransactionTableTableReferences extends BaseReferences<
    _$AppDatabase, $TransactionTableTable, TransactionTableData> {
  $$TransactionTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTableTable _categoryIdTable(_$AppDatabase db) =>
      db.categoryTable.createAlias($_aliasNameGenerator(
          db.transactionTable.categoryId, db.categoryTable.id));

  $$CategoryTableTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager = $$CategoryTableTableTableManager($_db, $_db.categoryTable)
        .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AccountReportTableTable _accountReportIdTable(_$AppDatabase db) =>
      db.accountReportTable.createAlias($_aliasNameGenerator(
          db.transactionTable.accountReportId, db.accountReportTable.id));

  $$AccountReportTableTableProcessedTableManager? get accountReportId {
    if ($_item.accountReportId == null) return null;
    final manager =
        $$AccountReportTableTableTableManager($_db, $_db.accountReportTable)
            .filter((f) => f.id($_item.accountReportId!));
    final item = $_typedResult.readTableOrNull(_accountReportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LifeSpanTableTable _lifeSpanIdTable(_$AppDatabase db) =>
      db.lifeSpanTable.createAlias($_aliasNameGenerator(
          db.transactionTable.lifeSpanId, db.lifeSpanTable.id));

  $$LifeSpanTableTableProcessedTableManager? get lifeSpanId {
    if ($_item.lifeSpanId == null) return null;
    final manager = $$LifeSpanTableTableTableManager($_db, $_db.lifeSpanTable)
        .filter((f) => f.id($_item.lifeSpanId!));
    final item = $_typedResult.readTableOrNull(_lifeSpanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get paymentDate => $state.composableBuilder(
      column: $state.table.paymentDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<TransactionTypes, TransactionTypes, int>
      get type => $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<bool> get isExpense => $state.composableBuilder(
      column: $state.table.isExpense,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isApproved => $state.composableBuilder(
      column: $state.table.isApproved,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$CategoryTableTableFilterComposer get categoryId {
    final $$CategoryTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categoryTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoryTableTableFilterComposer(ComposerState($state.db,
                $state.db.categoryTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$AccountReportTableTableFilterComposer get accountReportId {
    final $$AccountReportTableTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.accountReportId,
            referencedTable: $state.db.accountReportTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AccountReportTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.accountReportTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$LifeSpanTableTableFilterComposer get lifeSpanId {
    final $$LifeSpanTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.lifeSpanId,
        referencedTable: $state.db.lifeSpanTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$LifeSpanTableTableFilterComposer(ComposerState($state.db,
                $state.db.lifeSpanTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransactionTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionTableTable> {
  $$TransactionTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get paymentDate => $state.composableBuilder(
      column: $state.table.paymentDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isExpense => $state.composableBuilder(
      column: $state.table.isExpense,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isApproved => $state.composableBuilder(
      column: $state.table.isApproved,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CategoryTableTableOrderingComposer get categoryId {
    final $$CategoryTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $state.db.categoryTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$CategoryTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.categoryTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$AccountReportTableTableOrderingComposer get accountReportId {
    final $$AccountReportTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.accountReportId,
            referencedTable: $state.db.accountReportTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AccountReportTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.accountReportTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$LifeSpanTableTableOrderingComposer get lifeSpanId {
    final $$LifeSpanTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lifeSpanId,
            referencedTable: $state.db.lifeSpanTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$LifeSpanTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.lifeSpanTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransactionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionTableTable,
    TransactionTableData,
    $$TransactionTableTableFilterComposer,
    $$TransactionTableTableOrderingComposer,
    $$TransactionTableTableCreateCompanionBuilder,
    $$TransactionTableTableUpdateCompanionBuilder,
    (TransactionTableData, $$TransactionTableTableReferences),
    TransactionTableData,
    PrefetchHooks Function(
        {bool categoryId, bool accountReportId, bool lifeSpanId})> {
  $$TransactionTableTableTableManager(
      _$AppDatabase db, $TransactionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<TransactionTypes> type = const Value.absent(),
            Value<bool> isExpense = const Value.absent(),
            Value<bool> isApproved = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> accountReportId = const Value.absent(),
            Value<int?> lifeSpanId = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TransactionTableCompanion(
            id: id,
            amount: amount,
            paymentDate: paymentDate,
            title: title,
            type: type,
            isExpense: isExpense,
            isApproved: isApproved,
            categoryId: categoryId,
            accountReportId: accountReportId,
            lifeSpanId: lifeSpanId,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double amount,
            required DateTime paymentDate,
            required String title,
            required TransactionTypes type,
            required bool isExpense,
            required bool isApproved,
            required int categoryId,
            required int accountReportId,
            Value<int?> lifeSpanId = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TransactionTableCompanion.insert(
            id: id,
            amount: amount,
            paymentDate: paymentDate,
            title: title,
            type: type,
            isExpense: isExpense,
            isApproved: isApproved,
            categoryId: categoryId,
            accountReportId: accountReportId,
            lifeSpanId: lifeSpanId,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false,
              accountReportId = false,
              lifeSpanId = false}) {
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
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$TransactionTableTableReferences._categoryIdTable(db),
                    referencedColumn: $$TransactionTableTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }
                if (accountReportId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountReportId,
                    referencedTable: $$TransactionTableTableReferences
                        ._accountReportIdTable(db),
                    referencedColumn: $$TransactionTableTableReferences
                        ._accountReportIdTable(db)
                        .id,
                  ) as T;
                }
                if (lifeSpanId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.lifeSpanId,
                    referencedTable:
                        $$TransactionTableTableReferences._lifeSpanIdTable(db),
                    referencedColumn: $$TransactionTableTableReferences
                        ._lifeSpanIdTable(db)
                        .id,
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

typedef $$TransactionTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionTableTable,
    TransactionTableData,
    $$TransactionTableTableFilterComposer,
    $$TransactionTableTableOrderingComposer,
    $$TransactionTableTableCreateCompanionBuilder,
    $$TransactionTableTableUpdateCompanionBuilder,
    (TransactionTableData, $$TransactionTableTableReferences),
    TransactionTableData,
    PrefetchHooks Function(
        {bool categoryId, bool accountReportId, bool lifeSpanId})>;
typedef $$AppNotificationTableTableCreateCompanionBuilder
    = AppNotificationTableCompanion Function({
  Value<int> id,
  required String packageName,
  Value<Uint8List?> icon,
  Value<bool> saveNotifications,
});
typedef $$AppNotificationTableTableUpdateCompanionBuilder
    = AppNotificationTableCompanion Function({
  Value<int> id,
  Value<String> packageName,
  Value<Uint8List?> icon,
  Value<bool> saveNotifications,
});

final class $$AppNotificationTableTableReferences extends BaseReferences<
    _$AppDatabase, $AppNotificationTableTable, AppNotificationTableData> {
  $$AppNotificationTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppRegexTableTable, List<AppRegexTableData>>
      _appRegexTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.appRegexTable,
              aliasName: $_aliasNameGenerator(
                  db.appNotificationTable.id, db.appRegexTable.appId));

  $$AppRegexTableTableProcessedTableManager get appRegexTableRefs {
    final manager = $$AppRegexTableTableTableManager($_db, $_db.appRegexTable)
        .filter((f) => f.appId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_appRegexTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$NotificationTableTable,
      List<NotificationTableData>> _notificationTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.notificationTable,
          aliasName: $_aliasNameGenerator(
              db.appNotificationTable.id, db.notificationTable.appId));

  $$NotificationTableTableProcessedTableManager get notificationTableRefs {
    final manager =
        $$NotificationTableTableTableManager($_db, $_db.notificationTable)
            .filter((f) => f.appId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_notificationTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AppNotificationTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AppNotificationTableTable> {
  $$AppNotificationTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get packageName => $state.composableBuilder(
      column: $state.table.packageName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get saveNotifications => $state.composableBuilder(
      column: $state.table.saveNotifications,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter appRegexTableRefs(
      ComposableFilter Function($$AppRegexTableTableFilterComposer f) f) {
    final $$AppRegexTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.appRegexTable,
        getReferencedColumn: (t) => t.appId,
        builder: (joinBuilder, parentComposers) =>
            $$AppRegexTableTableFilterComposer(ComposerState($state.db,
                $state.db.appRegexTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter notificationTableRefs(
      ComposableFilter Function($$NotificationTableTableFilterComposer f) f) {
    final $$NotificationTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.notificationTable,
            getReferencedColumn: (t) => t.appId,
            builder: (joinBuilder, parentComposers) =>
                $$NotificationTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.notificationTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$AppNotificationTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AppNotificationTableTable> {
  $$AppNotificationTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get packageName => $state.composableBuilder(
      column: $state.table.packageName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get saveNotifications => $state.composableBuilder(
      column: $state.table.saveNotifications,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AppNotificationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppNotificationTableTable,
    AppNotificationTableData,
    $$AppNotificationTableTableFilterComposer,
    $$AppNotificationTableTableOrderingComposer,
    $$AppNotificationTableTableCreateCompanionBuilder,
    $$AppNotificationTableTableUpdateCompanionBuilder,
    (AppNotificationTableData, $$AppNotificationTableTableReferences),
    AppNotificationTableData,
    PrefetchHooks Function(
        {bool appRegexTableRefs, bool notificationTableRefs})> {
  $$AppNotificationTableTableTableManager(
      _$AppDatabase db, $AppNotificationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AppNotificationTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AppNotificationTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> packageName = const Value.absent(),
            Value<Uint8List?> icon = const Value.absent(),
            Value<bool> saveNotifications = const Value.absent(),
          }) =>
              AppNotificationTableCompanion(
            id: id,
            packageName: packageName,
            icon: icon,
            saveNotifications: saveNotifications,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String packageName,
            Value<Uint8List?> icon = const Value.absent(),
            Value<bool> saveNotifications = const Value.absent(),
          }) =>
              AppNotificationTableCompanion.insert(
            id: id,
            packageName: packageName,
            icon: icon,
            saveNotifications: saveNotifications,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AppNotificationTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {appRegexTableRefs = false, notificationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (appRegexTableRefs) db.appRegexTable,
                if (notificationTableRefs) db.notificationTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appRegexTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AppNotificationTableTableReferences
                            ._appRegexTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AppNotificationTableTableReferences(db, table, p0)
                                .appRegexTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.appId == item.id),
                        typedResults: items),
                  if (notificationTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AppNotificationTableTableReferences
                            ._notificationTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AppNotificationTableTableReferences(db, table, p0)
                                .notificationTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.appId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AppNotificationTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $AppNotificationTableTable,
        AppNotificationTableData,
        $$AppNotificationTableTableFilterComposer,
        $$AppNotificationTableTableOrderingComposer,
        $$AppNotificationTableTableCreateCompanionBuilder,
        $$AppNotificationTableTableUpdateCompanionBuilder,
        (AppNotificationTableData, $$AppNotificationTableTableReferences),
        AppNotificationTableData,
        PrefetchHooks Function(
            {bool appRegexTableRefs, bool notificationTableRefs})>;
typedef $$AppRegexTableTableCreateCompanionBuilder = AppRegexTableCompanion
    Function({
  Value<int> id,
  Value<bool> isPurchase,
  required int appId,
});
typedef $$AppRegexTableTableUpdateCompanionBuilder = AppRegexTableCompanion
    Function({
  Value<int> id,
  Value<bool> isPurchase,
  Value<int> appId,
});

final class $$AppRegexTableTableReferences extends BaseReferences<_$AppDatabase,
    $AppRegexTableTable, AppRegexTableData> {
  $$AppRegexTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AppNotificationTableTable _appIdTable(_$AppDatabase db) =>
      db.appNotificationTable.createAlias($_aliasNameGenerator(
          db.appRegexTable.appId, db.appNotificationTable.id));

  $$AppNotificationTableTableProcessedTableManager? get appId {
    if ($_item.appId == null) return null;
    final manager =
        $$AppNotificationTableTableTableManager($_db, $_db.appNotificationTable)
            .filter((f) => f.id($_item.appId!));
    final item = $_typedResult.readTableOrNull(_appIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RegexValuesTableTable, List<RegexValuesTableData>>
      _regexValuesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.regexValuesTable,
              aliasName: $_aliasNameGenerator(
                  db.appRegexTable.id, db.regexValuesTable.regexInfo));

  $$RegexValuesTableTableProcessedTableManager get regexValuesTableRefs {
    final manager =
        $$RegexValuesTableTableTableManager($_db, $_db.regexValuesTable)
            .filter((f) => f.regexInfo.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_regexValuesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AppRegexTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AppRegexTableTable> {
  $$AppRegexTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isPurchase => $state.composableBuilder(
      column: $state.table.isPurchase,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AppNotificationTableTableFilterComposer get appId {
    final $$AppNotificationTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.appId,
            referencedTable: $state.db.appNotificationTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AppNotificationTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.appNotificationTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  ComposableFilter regexValuesTableRefs(
      ComposableFilter Function($$RegexValuesTableTableFilterComposer f) f) {
    final $$RegexValuesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.regexValuesTable,
            getReferencedColumn: (t) => t.regexInfo,
            builder: (joinBuilder, parentComposers) =>
                $$RegexValuesTableTableFilterComposer(ComposerState($state.db,
                    $state.db.regexValuesTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$AppRegexTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AppRegexTableTable> {
  $$AppRegexTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isPurchase => $state.composableBuilder(
      column: $state.table.isPurchase,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AppNotificationTableTableOrderingComposer get appId {
    final $$AppNotificationTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.appId,
            referencedTable: $state.db.appNotificationTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AppNotificationTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.appNotificationTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$AppRegexTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppRegexTableTable,
    AppRegexTableData,
    $$AppRegexTableTableFilterComposer,
    $$AppRegexTableTableOrderingComposer,
    $$AppRegexTableTableCreateCompanionBuilder,
    $$AppRegexTableTableUpdateCompanionBuilder,
    (AppRegexTableData, $$AppRegexTableTableReferences),
    AppRegexTableData,
    PrefetchHooks Function({bool appId, bool regexValuesTableRefs})> {
  $$AppRegexTableTableTableManager(_$AppDatabase db, $AppRegexTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AppRegexTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AppRegexTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isPurchase = const Value.absent(),
            Value<int> appId = const Value.absent(),
          }) =>
              AppRegexTableCompanion(
            id: id,
            isPurchase: isPurchase,
            appId: appId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isPurchase = const Value.absent(),
            required int appId,
          }) =>
              AppRegexTableCompanion.insert(
            id: id,
            isPurchase: isPurchase,
            appId: appId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AppRegexTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {appId = false, regexValuesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (regexValuesTableRefs) db.regexValuesTable
              ],
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
                if (appId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.appId,
                    referencedTable:
                        $$AppRegexTableTableReferences._appIdTable(db),
                    referencedColumn:
                        $$AppRegexTableTableReferences._appIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (regexValuesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AppRegexTableTableReferences
                            ._regexValuesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AppRegexTableTableReferences(db, table, p0)
                                .regexValuesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.regexInfo == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AppRegexTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppRegexTableTable,
    AppRegexTableData,
    $$AppRegexTableTableFilterComposer,
    $$AppRegexTableTableOrderingComposer,
    $$AppRegexTableTableCreateCompanionBuilder,
    $$AppRegexTableTableUpdateCompanionBuilder,
    (AppRegexTableData, $$AppRegexTableTableReferences),
    AppRegexTableData,
    PrefetchHooks Function({bool appId, bool regexValuesTableRefs})>;
typedef $$RegexValuesTableTableCreateCompanionBuilder
    = RegexValuesTableCompanion Function({
  Value<int> id,
  Value<String?> titleRegex,
  Value<String?> triggerText,
  Value<String?> amountRegex,
  Value<String?> merchantRegex,
  required int regexInfo,
});
typedef $$RegexValuesTableTableUpdateCompanionBuilder
    = RegexValuesTableCompanion Function({
  Value<int> id,
  Value<String?> titleRegex,
  Value<String?> triggerText,
  Value<String?> amountRegex,
  Value<String?> merchantRegex,
  Value<int> regexInfo,
});

final class $$RegexValuesTableTableReferences extends BaseReferences<
    _$AppDatabase, $RegexValuesTableTable, RegexValuesTableData> {
  $$RegexValuesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AppRegexTableTable _regexInfoTable(_$AppDatabase db) =>
      db.appRegexTable.createAlias($_aliasNameGenerator(
          db.regexValuesTable.regexInfo, db.appRegexTable.id));

  $$AppRegexTableTableProcessedTableManager? get regexInfo {
    if ($_item.regexInfo == null) return null;
    final manager = $$AppRegexTableTableTableManager($_db, $_db.appRegexTable)
        .filter((f) => f.id($_item.regexInfo!));
    final item = $_typedResult.readTableOrNull(_regexInfoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RegexValuesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RegexValuesTableTable> {
  $$RegexValuesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get titleRegex => $state.composableBuilder(
      column: $state.table.titleRegex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get triggerText => $state.composableBuilder(
      column: $state.table.triggerText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get amountRegex => $state.composableBuilder(
      column: $state.table.amountRegex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get merchantRegex => $state.composableBuilder(
      column: $state.table.merchantRegex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AppRegexTableTableFilterComposer get regexInfo {
    final $$AppRegexTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.regexInfo,
        referencedTable: $state.db.appRegexTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AppRegexTableTableFilterComposer(ComposerState($state.db,
                $state.db.appRegexTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RegexValuesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RegexValuesTableTable> {
  $$RegexValuesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get titleRegex => $state.composableBuilder(
      column: $state.table.titleRegex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get triggerText => $state.composableBuilder(
      column: $state.table.triggerText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get amountRegex => $state.composableBuilder(
      column: $state.table.amountRegex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get merchantRegex => $state.composableBuilder(
      column: $state.table.merchantRegex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AppRegexTableTableOrderingComposer get regexInfo {
    final $$AppRegexTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.regexInfo,
            referencedTable: $state.db.appRegexTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AppRegexTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.appRegexTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RegexValuesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RegexValuesTableTable,
    RegexValuesTableData,
    $$RegexValuesTableTableFilterComposer,
    $$RegexValuesTableTableOrderingComposer,
    $$RegexValuesTableTableCreateCompanionBuilder,
    $$RegexValuesTableTableUpdateCompanionBuilder,
    (RegexValuesTableData, $$RegexValuesTableTableReferences),
    RegexValuesTableData,
    PrefetchHooks Function({bool regexInfo})> {
  $$RegexValuesTableTableTableManager(
      _$AppDatabase db, $RegexValuesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RegexValuesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RegexValuesTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> titleRegex = const Value.absent(),
            Value<String?> triggerText = const Value.absent(),
            Value<String?> amountRegex = const Value.absent(),
            Value<String?> merchantRegex = const Value.absent(),
            Value<int> regexInfo = const Value.absent(),
          }) =>
              RegexValuesTableCompanion(
            id: id,
            titleRegex: titleRegex,
            triggerText: triggerText,
            amountRegex: amountRegex,
            merchantRegex: merchantRegex,
            regexInfo: regexInfo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> titleRegex = const Value.absent(),
            Value<String?> triggerText = const Value.absent(),
            Value<String?> amountRegex = const Value.absent(),
            Value<String?> merchantRegex = const Value.absent(),
            required int regexInfo,
          }) =>
              RegexValuesTableCompanion.insert(
            id: id,
            titleRegex: titleRegex,
            triggerText: triggerText,
            amountRegex: amountRegex,
            merchantRegex: merchantRegex,
            regexInfo: regexInfo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RegexValuesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({regexInfo = false}) {
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
                if (regexInfo) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.regexInfo,
                    referencedTable:
                        $$RegexValuesTableTableReferences._regexInfoTable(db),
                    referencedColumn: $$RegexValuesTableTableReferences
                        ._regexInfoTable(db)
                        .id,
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

typedef $$RegexValuesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RegexValuesTableTable,
    RegexValuesTableData,
    $$RegexValuesTableTableFilterComposer,
    $$RegexValuesTableTableOrderingComposer,
    $$RegexValuesTableTableCreateCompanionBuilder,
    $$RegexValuesTableTableUpdateCompanionBuilder,
    (RegexValuesTableData, $$RegexValuesTableTableReferences),
    RegexValuesTableData,
    PrefetchHooks Function({bool regexInfo})>;
typedef $$NotificationTableTableCreateCompanionBuilder
    = NotificationTableCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  required DateTime time,
  required int appId,
  Value<bool> hasRegexMatch,
  Value<String?> infoText,
  Value<String?> bigText,
  Value<String?> subText,
});
typedef $$NotificationTableTableUpdateCompanionBuilder
    = NotificationTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<DateTime> time,
  Value<int> appId,
  Value<bool> hasRegexMatch,
  Value<String?> infoText,
  Value<String?> bigText,
  Value<String?> subText,
});

final class $$NotificationTableTableReferences extends BaseReferences<
    _$AppDatabase, $NotificationTableTable, NotificationTableData> {
  $$NotificationTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AppNotificationTableTable _appIdTable(_$AppDatabase db) =>
      db.appNotificationTable.createAlias($_aliasNameGenerator(
          db.notificationTable.appId, db.appNotificationTable.id));

  $$AppNotificationTableTableProcessedTableManager? get appId {
    if ($_item.appId == null) return null;
    final manager =
        $$AppNotificationTableTableTableManager($_db, $_db.appNotificationTable)
            .filter((f) => f.id($_item.appId!));
    final item = $_typedResult.readTableOrNull(_appIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$NotificationTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NotificationTableTable> {
  $$NotificationTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasRegexMatch => $state.composableBuilder(
      column: $state.table.hasRegexMatch,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get infoText => $state.composableBuilder(
      column: $state.table.infoText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bigText => $state.composableBuilder(
      column: $state.table.bigText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subText => $state.composableBuilder(
      column: $state.table.subText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AppNotificationTableTableFilterComposer get appId {
    final $$AppNotificationTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.appId,
            referencedTable: $state.db.appNotificationTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AppNotificationTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.appNotificationTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$NotificationTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NotificationTableTable> {
  $$NotificationTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasRegexMatch => $state.composableBuilder(
      column: $state.table.hasRegexMatch,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get infoText => $state.composableBuilder(
      column: $state.table.infoText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bigText => $state.composableBuilder(
      column: $state.table.bigText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subText => $state.composableBuilder(
      column: $state.table.subText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AppNotificationTableTableOrderingComposer get appId {
    final $$AppNotificationTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.appId,
            referencedTable: $state.db.appNotificationTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$AppNotificationTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.appNotificationTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$NotificationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationTableTable,
    NotificationTableData,
    $$NotificationTableTableFilterComposer,
    $$NotificationTableTableOrderingComposer,
    $$NotificationTableTableCreateCompanionBuilder,
    $$NotificationTableTableUpdateCompanionBuilder,
    (NotificationTableData, $$NotificationTableTableReferences),
    NotificationTableData,
    PrefetchHooks Function({bool appId})> {
  $$NotificationTableTableTableManager(
      _$AppDatabase db, $NotificationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotificationTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$NotificationTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> time = const Value.absent(),
            Value<int> appId = const Value.absent(),
            Value<bool> hasRegexMatch = const Value.absent(),
            Value<String?> infoText = const Value.absent(),
            Value<String?> bigText = const Value.absent(),
            Value<String?> subText = const Value.absent(),
          }) =>
              NotificationTableCompanion(
            id: id,
            title: title,
            description: description,
            time: time,
            appId: appId,
            hasRegexMatch: hasRegexMatch,
            infoText: infoText,
            bigText: bigText,
            subText: subText,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required DateTime time,
            required int appId,
            Value<bool> hasRegexMatch = const Value.absent(),
            Value<String?> infoText = const Value.absent(),
            Value<String?> bigText = const Value.absent(),
            Value<String?> subText = const Value.absent(),
          }) =>
              NotificationTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            time: time,
            appId: appId,
            hasRegexMatch: hasRegexMatch,
            infoText: infoText,
            bigText: bigText,
            subText: subText,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NotificationTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({appId = false}) {
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
                if (appId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.appId,
                    referencedTable:
                        $$NotificationTableTableReferences._appIdTable(db),
                    referencedColumn:
                        $$NotificationTableTableReferences._appIdTable(db).id,
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

typedef $$NotificationTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotificationTableTable,
    NotificationTableData,
    $$NotificationTableTableFilterComposer,
    $$NotificationTableTableOrderingComposer,
    $$NotificationTableTableCreateCompanionBuilder,
    $$NotificationTableTableUpdateCompanionBuilder,
    (NotificationTableData, $$NotificationTableTableReferences),
    NotificationTableData,
    PrefetchHooks Function({bool appId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BankTableTableTableManager get bankTable =>
      $$BankTableTableTableManager(_db, _db.bankTable);
  $$AccountTableTableTableManager get accountTable =>
      $$AccountTableTableTableManager(_db, _db.accountTable);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$LifeSpanTableTableTableManager get lifeSpanTable =>
      $$LifeSpanTableTableTableManager(_db, _db.lifeSpanTable);
  $$AccountReportTableTableTableManager get accountReportTable =>
      $$AccountReportTableTableTableManager(_db, _db.accountReportTable);
  $$TransactionTableTableTableManager get transactionTable =>
      $$TransactionTableTableTableManager(_db, _db.transactionTable);
  $$AppNotificationTableTableTableManager get appNotificationTable =>
      $$AppNotificationTableTableTableManager(_db, _db.appNotificationTable);
  $$AppRegexTableTableTableManager get appRegexTable =>
      $$AppRegexTableTableTableManager(_db, _db.appRegexTable);
  $$RegexValuesTableTableTableManager get regexValuesTable =>
      $$RegexValuesTableTableTableManager(_db, _db.regexValuesTable);
  $$NotificationTableTableTableManager get notificationTable =>
      $$NotificationTableTableTableManager(_db, _db.notificationTable);
}
