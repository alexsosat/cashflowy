// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 8),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumnWithTypeConverter<AccountTypeEnum, int> typeId =
      GeneratedColumn<int>('type_id', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<AccountTypeEnum>($AccountTableTable.$convertertypeId);
  @override
  List<GeneratedColumn> get $columns => [id, name, color, currency, typeId];
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
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    context.handle(_typeIdMeta, const VerificationResult.success());
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
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      typeId: $AccountTableTable.$convertertypeId.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!),
    );
  }

  @override
  $AccountTableTable createAlias(String alias) {
    return $AccountTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountTypeEnum, int, int> $convertertypeId =
      const EnumIndexConverter<AccountTypeEnum>(AccountTypeEnum.values);
}

class AccountTableData extends DataClass
    implements Insertable<AccountTableData> {
  /// Unique identifier of the account
  final int id;

  /// Name of the account
  final String name;

  /// Color of the account represented stored in hexadecimal value
  final String? color;

  /// Currency of the account
  ///
  /// This value is stored as the minified expression of the currency
  /// Eg. mxn, usd
  final String currency;

  /// Type of account
  ///
  /// This value is stored as an int and the drift packages makes the conversion to an enum
  final AccountTypeEnum typeId;
  const AccountTableData(
      {required this.id,
      required this.name,
      this.color,
      required this.currency,
      required this.typeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['currency'] = Variable<String>(currency);
    {
      map['type_id'] =
          Variable<int>($AccountTableTable.$convertertypeId.toSql(typeId));
    }
    return map;
  }

  AccountTableCompanion toCompanion(bool nullToAbsent) {
    return AccountTableCompanion(
      id: Value(id),
      name: Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      currency: Value(currency),
      typeId: Value(typeId),
    );
  }

  factory AccountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      currency: serializer.fromJson<String>(json['currency']),
      typeId: $AccountTableTable.$convertertypeId
          .fromJson(serializer.fromJson<int>(json['typeId'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'currency': serializer.toJson<String>(currency),
      'typeId': serializer
          .toJson<int>($AccountTableTable.$convertertypeId.toJson(typeId)),
    };
  }

  AccountTableData copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          String? currency,
          AccountTypeEnum? typeId}) =>
      AccountTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        currency: currency ?? this.currency,
        typeId: typeId ?? this.typeId,
      );
  AccountTableData copyWithCompanion(AccountTableCompanion data) {
    return AccountTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      currency: data.currency.present ? data.currency.value : this.currency,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('currency: $currency, ')
          ..write('typeId: $typeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, currency, typeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.currency == this.currency &&
          other.typeId == this.typeId);
}

class AccountTableCompanion extends UpdateCompanion<AccountTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String> currency;
  final Value<AccountTypeEnum> typeId;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.currency = const Value.absent(),
    this.typeId = const Value.absent(),
  });
  AccountTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    required String currency,
    this.typeId = const Value.absent(),
  })  : name = Value(name),
        currency = Value(currency);
  static Insertable<AccountTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? currency,
    Expression<int>? typeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (currency != null) 'currency': currency,
      if (typeId != null) 'type_id': typeId,
    });
  }

  AccountTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<String>? currency,
      Value<AccountTypeEnum>? typeId}) {
    return AccountTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      currency: currency ?? this.currency,
      typeId: typeId ?? this.typeId,
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
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(
          $AccountTableTable.$convertertypeId.toSql(typeId.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('currency: $currency, ')
          ..write('typeId: $typeId')
          ..write(')'))
        .toString();
  }
}

class $CardTableTable extends CardTable
    with TableInfo<$CardTableTable, CardTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 16, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumnWithTypeConverter<BankCardTypeEnum, int> typeId =
      GeneratedColumn<int>('type_id', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<BankCardTypeEnum>($CardTableTable.$convertertypeId);
  @override
  List<GeneratedColumn> get $columns => [id, number, typeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_table';
  @override
  VerificationContext validateIntegrity(Insertable<CardTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    context.handle(_typeIdMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      typeId: $CardTableTable.$convertertypeId.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!),
    );
  }

  @override
  $CardTableTable createAlias(String alias) {
    return $CardTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BankCardTypeEnum, int, int> $convertertypeId =
      const EnumIndexConverter<BankCardTypeEnum>(BankCardTypeEnum.values);
}

class CardTableData extends DataClass implements Insertable<CardTableData> {
  /// Unique identifier of the card
  final int id;

  /// Number of the card
  final String number;

  /// Type of account
  ///
  /// This value is stored as an int and the drift packages makes the conversion to an enum
  final BankCardTypeEnum typeId;
  const CardTableData(
      {required this.id, required this.number, required this.typeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<String>(number);
    {
      map['type_id'] =
          Variable<int>($CardTableTable.$convertertypeId.toSql(typeId));
    }
    return map;
  }

  CardTableCompanion toCompanion(bool nullToAbsent) {
    return CardTableCompanion(
      id: Value(id),
      number: Value(number),
      typeId: Value(typeId),
    );
  }

  factory CardTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardTableData(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<String>(json['number']),
      typeId: $CardTableTable.$convertertypeId
          .fromJson(serializer.fromJson<int>(json['typeId'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<String>(number),
      'typeId': serializer
          .toJson<int>($CardTableTable.$convertertypeId.toJson(typeId)),
    };
  }

  CardTableData copyWith({int? id, String? number, BankCardTypeEnum? typeId}) =>
      CardTableData(
        id: id ?? this.id,
        number: number ?? this.number,
        typeId: typeId ?? this.typeId,
      );
  CardTableData copyWithCompanion(CardTableCompanion data) {
    return CardTableData(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardTableData(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('typeId: $typeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, number, typeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardTableData &&
          other.id == this.id &&
          other.number == this.number &&
          other.typeId == this.typeId);
}

class CardTableCompanion extends UpdateCompanion<CardTableData> {
  final Value<int> id;
  final Value<String> number;
  final Value<BankCardTypeEnum> typeId;
  const CardTableCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.typeId = const Value.absent(),
  });
  CardTableCompanion.insert({
    this.id = const Value.absent(),
    required String number,
    this.typeId = const Value.absent(),
  }) : number = Value(number);
  static Insertable<CardTableData> custom({
    Expression<int>? id,
    Expression<String>? number,
    Expression<int>? typeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (typeId != null) 'type_id': typeId,
    });
  }

  CardTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? number,
      Value<BankCardTypeEnum>? typeId}) {
    return CardTableCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      typeId: typeId ?? this.typeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (typeId.present) {
      map['type_id'] =
          Variable<int>($CardTableTable.$convertertypeId.toSql(typeId.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardTableCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('typeId: $typeId')
          ..write(')'))
        .toString();
  }
}

class $AccountCardRelTableTable extends AccountCardRelTable
    with TableInfo<$AccountCardRelTableTable, AccountCardRelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountCardRelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES account_table (id)'));
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES card_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [accountId, cardId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_card_rel_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AccountCardRelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AccountCardRelTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountCardRelTableData(
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
    );
  }

  @override
  $AccountCardRelTableTable createAlias(String alias) {
    return $AccountCardRelTableTable(attachedDatabase, alias);
  }
}

class AccountCardRelTableData extends DataClass
    implements Insertable<AccountCardRelTableData> {
  /// Foreign key to the account table
  final int accountId;

  /// Foreign key to the card table
  final int cardId;
  const AccountCardRelTableData(
      {required this.accountId, required this.cardId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['card_id'] = Variable<int>(cardId);
    return map;
  }

  AccountCardRelTableCompanion toCompanion(bool nullToAbsent) {
    return AccountCardRelTableCompanion(
      accountId: Value(accountId),
      cardId: Value(cardId),
    );
  }

  factory AccountCardRelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountCardRelTableData(
      accountId: serializer.fromJson<int>(json['accountId']),
      cardId: serializer.fromJson<int>(json['cardId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'cardId': serializer.toJson<int>(cardId),
    };
  }

  AccountCardRelTableData copyWith({int? accountId, int? cardId}) =>
      AccountCardRelTableData(
        accountId: accountId ?? this.accountId,
        cardId: cardId ?? this.cardId,
      );
  AccountCardRelTableData copyWithCompanion(AccountCardRelTableCompanion data) {
    return AccountCardRelTableData(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountCardRelTableData(')
          ..write('accountId: $accountId, ')
          ..write('cardId: $cardId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, cardId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountCardRelTableData &&
          other.accountId == this.accountId &&
          other.cardId == this.cardId);
}

class AccountCardRelTableCompanion
    extends UpdateCompanion<AccountCardRelTableData> {
  final Value<int> accountId;
  final Value<int> cardId;
  final Value<int> rowid;
  const AccountCardRelTableCompanion({
    this.accountId = const Value.absent(),
    this.cardId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountCardRelTableCompanion.insert({
    required int accountId,
    required int cardId,
    this.rowid = const Value.absent(),
  })  : accountId = Value(accountId),
        cardId = Value(cardId);
  static Insertable<AccountCardRelTableData> custom({
    Expression<int>? accountId,
    Expression<int>? cardId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (cardId != null) 'card_id': cardId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountCardRelTableCompanion copyWith(
      {Value<int>? accountId, Value<int>? cardId, Value<int>? rowid}) {
    return AccountCardRelTableCompanion(
      accountId: accountId ?? this.accountId,
      cardId: cardId ?? this.cardId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountCardRelTableCompanion(')
          ..write('accountId: $accountId, ')
          ..write('cardId: $cardId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CreditLoanTableTable extends CreditLoanTable
    with TableInfo<$CreditLoanTableTable, CreditLoanTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditLoanTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _monthlyInterestRateMeta =
      const VerificationMeta('monthlyInterestRate');
  @override
  late final GeneratedColumn<double> monthlyInterestRate =
      GeneratedColumn<double>('monthly_interest_rate', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _statementClosingDateMeta =
      const VerificationMeta('statementClosingDate');
  @override
  late final GeneratedColumn<DateTime> statementClosingDate =
      GeneratedColumn<DateTime>('statement_closing_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statementPaymentDateMeta =
      const VerificationMeta('statementPaymentDate');
  @override
  late final GeneratedColumn<DateTime> statementPaymentDate =
      GeneratedColumn<DateTime>('statement_payment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        monthlyInterestRate,
        statementClosingDate,
        statementPaymentDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credit_loan_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CreditLoanTableData> instance,
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
    if (data.containsKey('monthly_interest_rate')) {
      context.handle(
          _monthlyInterestRateMeta,
          monthlyInterestRate.isAcceptableOrUnknown(
              data['monthly_interest_rate']!, _monthlyInterestRateMeta));
    } else if (isInserting) {
      context.missing(_monthlyInterestRateMeta);
    }
    if (data.containsKey('statement_closing_date')) {
      context.handle(
          _statementClosingDateMeta,
          statementClosingDate.isAcceptableOrUnknown(
              data['statement_closing_date']!, _statementClosingDateMeta));
    } else if (isInserting) {
      context.missing(_statementClosingDateMeta);
    }
    if (data.containsKey('statement_payment_date')) {
      context.handle(
          _statementPaymentDateMeta,
          statementPaymentDate.isAcceptableOrUnknown(
              data['statement_payment_date']!, _statementPaymentDateMeta));
    } else if (isInserting) {
      context.missing(_statementPaymentDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditLoanTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditLoanTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      monthlyInterestRate: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}monthly_interest_rate'])!,
      statementClosingDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}statement_closing_date'])!,
      statementPaymentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}statement_payment_date'])!,
    );
  }

  @override
  $CreditLoanTableTable createAlias(String alias) {
    return $CreditLoanTableTable(attachedDatabase, alias);
  }
}

class CreditLoanTableData extends DataClass
    implements Insertable<CreditLoanTableData> {
  /// Unique identifier of the credit loan
  final int id;

  /// Amount of the credit loan
  final double amount;

  /// Monthly interest rate of the credit loan
  final double monthlyInterestRate;

  /// Statement date of the credit loan
  final DateTime statementClosingDate;

  /// Payment date of the credit loan
  final DateTime statementPaymentDate;
  const CreditLoanTableData(
      {required this.id,
      required this.amount,
      required this.monthlyInterestRate,
      required this.statementClosingDate,
      required this.statementPaymentDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['monthly_interest_rate'] = Variable<double>(monthlyInterestRate);
    map['statement_closing_date'] = Variable<DateTime>(statementClosingDate);
    map['statement_payment_date'] = Variable<DateTime>(statementPaymentDate);
    return map;
  }

  CreditLoanTableCompanion toCompanion(bool nullToAbsent) {
    return CreditLoanTableCompanion(
      id: Value(id),
      amount: Value(amount),
      monthlyInterestRate: Value(monthlyInterestRate),
      statementClosingDate: Value(statementClosingDate),
      statementPaymentDate: Value(statementPaymentDate),
    );
  }

  factory CreditLoanTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditLoanTableData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      monthlyInterestRate:
          serializer.fromJson<double>(json['monthlyInterestRate']),
      statementClosingDate:
          serializer.fromJson<DateTime>(json['statementClosingDate']),
      statementPaymentDate:
          serializer.fromJson<DateTime>(json['statementPaymentDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'monthlyInterestRate': serializer.toJson<double>(monthlyInterestRate),
      'statementClosingDate': serializer.toJson<DateTime>(statementClosingDate),
      'statementPaymentDate': serializer.toJson<DateTime>(statementPaymentDate),
    };
  }

  CreditLoanTableData copyWith(
          {int? id,
          double? amount,
          double? monthlyInterestRate,
          DateTime? statementClosingDate,
          DateTime? statementPaymentDate}) =>
      CreditLoanTableData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        monthlyInterestRate: monthlyInterestRate ?? this.monthlyInterestRate,
        statementClosingDate: statementClosingDate ?? this.statementClosingDate,
        statementPaymentDate: statementPaymentDate ?? this.statementPaymentDate,
      );
  CreditLoanTableData copyWithCompanion(CreditLoanTableCompanion data) {
    return CreditLoanTableData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      monthlyInterestRate: data.monthlyInterestRate.present
          ? data.monthlyInterestRate.value
          : this.monthlyInterestRate,
      statementClosingDate: data.statementClosingDate.present
          ? data.statementClosingDate.value
          : this.statementClosingDate,
      statementPaymentDate: data.statementPaymentDate.present
          ? data.statementPaymentDate.value
          : this.statementPaymentDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditLoanTableData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('monthlyInterestRate: $monthlyInterestRate, ')
          ..write('statementClosingDate: $statementClosingDate, ')
          ..write('statementPaymentDate: $statementPaymentDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, monthlyInterestRate,
      statementClosingDate, statementPaymentDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditLoanTableData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.monthlyInterestRate == this.monthlyInterestRate &&
          other.statementClosingDate == this.statementClosingDate &&
          other.statementPaymentDate == this.statementPaymentDate);
}

class CreditLoanTableCompanion extends UpdateCompanion<CreditLoanTableData> {
  final Value<int> id;
  final Value<double> amount;
  final Value<double> monthlyInterestRate;
  final Value<DateTime> statementClosingDate;
  final Value<DateTime> statementPaymentDate;
  const CreditLoanTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.monthlyInterestRate = const Value.absent(),
    this.statementClosingDate = const Value.absent(),
    this.statementPaymentDate = const Value.absent(),
  });
  CreditLoanTableCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required double monthlyInterestRate,
    required DateTime statementClosingDate,
    required DateTime statementPaymentDate,
  })  : amount = Value(amount),
        monthlyInterestRate = Value(monthlyInterestRate),
        statementClosingDate = Value(statementClosingDate),
        statementPaymentDate = Value(statementPaymentDate);
  static Insertable<CreditLoanTableData> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<double>? monthlyInterestRate,
    Expression<DateTime>? statementClosingDate,
    Expression<DateTime>? statementPaymentDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (monthlyInterestRate != null)
        'monthly_interest_rate': monthlyInterestRate,
      if (statementClosingDate != null)
        'statement_closing_date': statementClosingDate,
      if (statementPaymentDate != null)
        'statement_payment_date': statementPaymentDate,
    });
  }

  CreditLoanTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<double>? monthlyInterestRate,
      Value<DateTime>? statementClosingDate,
      Value<DateTime>? statementPaymentDate}) {
    return CreditLoanTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      monthlyInterestRate: monthlyInterestRate ?? this.monthlyInterestRate,
      statementClosingDate: statementClosingDate ?? this.statementClosingDate,
      statementPaymentDate: statementPaymentDate ?? this.statementPaymentDate,
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
    if (monthlyInterestRate.present) {
      map['monthly_interest_rate'] =
          Variable<double>(monthlyInterestRate.value);
    }
    if (statementClosingDate.present) {
      map['statement_closing_date'] =
          Variable<DateTime>(statementClosingDate.value);
    }
    if (statementPaymentDate.present) {
      map['statement_payment_date'] =
          Variable<DateTime>(statementPaymentDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditLoanTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('monthlyInterestRate: $monthlyInterestRate, ')
          ..write('statementClosingDate: $statementClosingDate, ')
          ..write('statementPaymentDate: $statementPaymentDate')
          ..write(')'))
        .toString();
  }
}

class $CardCreditRelTableTable extends CardCreditRelTable
    with TableInfo<$CardCreditRelTableTable, CardCreditRelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardCreditRelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES card_table (id)'));
  static const VerificationMeta _creditIdMeta =
      const VerificationMeta('creditId');
  @override
  late final GeneratedColumn<int> creditId = GeneratedColumn<int>(
      'credit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES credit_loan_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [cardId, creditId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_credit_rel_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CardCreditRelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('credit_id')) {
      context.handle(_creditIdMeta,
          creditId.isAcceptableOrUnknown(data['credit_id']!, _creditIdMeta));
    } else if (isInserting) {
      context.missing(_creditIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CardCreditRelTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardCreditRelTableData(
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      creditId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credit_id'])!,
    );
  }

  @override
  $CardCreditRelTableTable createAlias(String alias) {
    return $CardCreditRelTableTable(attachedDatabase, alias);
  }
}

class CardCreditRelTableData extends DataClass
    implements Insertable<CardCreditRelTableData> {
  /// Foreign key to the card table
  final int cardId;

  /// Foreign key to the credit card loan table
  final int creditId;
  const CardCreditRelTableData({required this.cardId, required this.creditId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<int>(cardId);
    map['credit_id'] = Variable<int>(creditId);
    return map;
  }

  CardCreditRelTableCompanion toCompanion(bool nullToAbsent) {
    return CardCreditRelTableCompanion(
      cardId: Value(cardId),
      creditId: Value(creditId),
    );
  }

  factory CardCreditRelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardCreditRelTableData(
      cardId: serializer.fromJson<int>(json['cardId']),
      creditId: serializer.fromJson<int>(json['creditId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<int>(cardId),
      'creditId': serializer.toJson<int>(creditId),
    };
  }

  CardCreditRelTableData copyWith({int? cardId, int? creditId}) =>
      CardCreditRelTableData(
        cardId: cardId ?? this.cardId,
        creditId: creditId ?? this.creditId,
      );
  CardCreditRelTableData copyWithCompanion(CardCreditRelTableCompanion data) {
    return CardCreditRelTableData(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      creditId: data.creditId.present ? data.creditId.value : this.creditId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardCreditRelTableData(')
          ..write('cardId: $cardId, ')
          ..write('creditId: $creditId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardId, creditId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardCreditRelTableData &&
          other.cardId == this.cardId &&
          other.creditId == this.creditId);
}

class CardCreditRelTableCompanion
    extends UpdateCompanion<CardCreditRelTableData> {
  final Value<int> cardId;
  final Value<int> creditId;
  final Value<int> rowid;
  const CardCreditRelTableCompanion({
    this.cardId = const Value.absent(),
    this.creditId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardCreditRelTableCompanion.insert({
    required int cardId,
    required int creditId,
    this.rowid = const Value.absent(),
  })  : cardId = Value(cardId),
        creditId = Value(creditId);
  static Insertable<CardCreditRelTableData> custom({
    Expression<int>? cardId,
    Expression<int>? creditId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (creditId != null) 'credit_id': creditId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardCreditRelTableCompanion copyWith(
      {Value<int>? cardId, Value<int>? creditId, Value<int>? rowid}) {
    return CardCreditRelTableCompanion(
      cardId: cardId ?? this.cardId,
      creditId: creditId ?? this.creditId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (creditId.present) {
      map['credit_id'] = Variable<int>(creditId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardCreditRelTableCompanion(')
          ..write('cardId: $cardId, ')
          ..write('creditId: $creditId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IssuerTableTable extends IssuerTable
    with TableInfo<$IssuerTableTable, IssuerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssuerTableTable(this.attachedDatabase, [this._alias]);
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
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'issuer_table';
  @override
  VerificationContext validateIntegrity(Insertable<IssuerTableData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IssuerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IssuerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $IssuerTableTable createAlias(String alias) {
    return $IssuerTableTable(attachedDatabase, alias);
  }
}

class IssuerTableData extends DataClass implements Insertable<IssuerTableData> {
  /// Unique identifier of the issuer
  final int id;

  /// Name of the issuer
  final String name;
  const IssuerTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  IssuerTableCompanion toCompanion(bool nullToAbsent) {
    return IssuerTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory IssuerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IssuerTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  IssuerTableData copyWith({int? id, String? name}) => IssuerTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  IssuerTableData copyWithCompanion(IssuerTableCompanion data) {
    return IssuerTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IssuerTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IssuerTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class IssuerTableCompanion extends UpdateCompanion<IssuerTableData> {
  final Value<int> id;
  final Value<String> name;
  const IssuerTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  IssuerTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<IssuerTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  IssuerTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return IssuerTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssuerTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CardIssuerRelTableTable extends CardIssuerRelTable
    with TableInfo<$CardIssuerRelTableTable, CardIssuerRelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardIssuerRelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES card_table (id)'));
  static const VerificationMeta _issuerIdMeta =
      const VerificationMeta('issuerId');
  @override
  late final GeneratedColumn<int> issuerId = GeneratedColumn<int>(
      'issuer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES issuer_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [cardId, issuerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_issuer_rel_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CardIssuerRelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('issuer_id')) {
      context.handle(_issuerIdMeta,
          issuerId.isAcceptableOrUnknown(data['issuer_id']!, _issuerIdMeta));
    } else if (isInserting) {
      context.missing(_issuerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CardIssuerRelTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardIssuerRelTableData(
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      issuerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}issuer_id'])!,
    );
  }

  @override
  $CardIssuerRelTableTable createAlias(String alias) {
    return $CardIssuerRelTableTable(attachedDatabase, alias);
  }
}

class CardIssuerRelTableData extends DataClass
    implements Insertable<CardIssuerRelTableData> {
  /// Foreign key to the card table
  final int cardId;

  /// Foreign key to the issuer table
  final int issuerId;
  const CardIssuerRelTableData({required this.cardId, required this.issuerId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<int>(cardId);
    map['issuer_id'] = Variable<int>(issuerId);
    return map;
  }

  CardIssuerRelTableCompanion toCompanion(bool nullToAbsent) {
    return CardIssuerRelTableCompanion(
      cardId: Value(cardId),
      issuerId: Value(issuerId),
    );
  }

  factory CardIssuerRelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardIssuerRelTableData(
      cardId: serializer.fromJson<int>(json['cardId']),
      issuerId: serializer.fromJson<int>(json['issuerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<int>(cardId),
      'issuerId': serializer.toJson<int>(issuerId),
    };
  }

  CardIssuerRelTableData copyWith({int? cardId, int? issuerId}) =>
      CardIssuerRelTableData(
        cardId: cardId ?? this.cardId,
        issuerId: issuerId ?? this.issuerId,
      );
  CardIssuerRelTableData copyWithCompanion(CardIssuerRelTableCompanion data) {
    return CardIssuerRelTableData(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      issuerId: data.issuerId.present ? data.issuerId.value : this.issuerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardIssuerRelTableData(')
          ..write('cardId: $cardId, ')
          ..write('issuerId: $issuerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardId, issuerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardIssuerRelTableData &&
          other.cardId == this.cardId &&
          other.issuerId == this.issuerId);
}

class CardIssuerRelTableCompanion
    extends UpdateCompanion<CardIssuerRelTableData> {
  final Value<int> cardId;
  final Value<int> issuerId;
  final Value<int> rowid;
  const CardIssuerRelTableCompanion({
    this.cardId = const Value.absent(),
    this.issuerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardIssuerRelTableCompanion.insert({
    required int cardId,
    required int issuerId,
    this.rowid = const Value.absent(),
  })  : cardId = Value(cardId),
        issuerId = Value(issuerId);
  static Insertable<CardIssuerRelTableData> custom({
    Expression<int>? cardId,
    Expression<int>? issuerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (issuerId != null) 'issuer_id': issuerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardIssuerRelTableCompanion copyWith(
      {Value<int>? cardId, Value<int>? issuerId, Value<int>? rowid}) {
    return CardIssuerRelTableCompanion(
      cardId: cardId ?? this.cardId,
      issuerId: issuerId ?? this.issuerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (issuerId.present) {
      map['issuer_id'] = Variable<int>(issuerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardIssuerRelTableCompanion(')
          ..write('cardId: $cardId, ')
          ..write('issuerId: $issuerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

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
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _appBundleMeta =
      const VerificationMeta('appBundle');
  @override
  late final GeneratedColumn<String> appBundle = GeneratedColumn<String>(
      'app_bundle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, appBundle];
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
    if (data.containsKey('app_bundle')) {
      context.handle(_appBundleMeta,
          appBundle.isAcceptableOrUnknown(data['app_bundle']!, _appBundleMeta));
    } else if (isInserting) {
      context.missing(_appBundleMeta);
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
      appBundle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_bundle'])!,
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

  /// App bundle of the bank
  final String appBundle;
  const BankTableData(
      {required this.id, required this.name, required this.appBundle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['app_bundle'] = Variable<String>(appBundle);
    return map;
  }

  BankTableCompanion toCompanion(bool nullToAbsent) {
    return BankTableCompanion(
      id: Value(id),
      name: Value(name),
      appBundle: Value(appBundle),
    );
  }

  factory BankTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      appBundle: serializer.fromJson<String>(json['appBundle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'appBundle': serializer.toJson<String>(appBundle),
    };
  }

  BankTableData copyWith({int? id, String? name, String? appBundle}) =>
      BankTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        appBundle: appBundle ?? this.appBundle,
      );
  BankTableData copyWithCompanion(BankTableCompanion data) {
    return BankTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      appBundle: data.appBundle.present ? data.appBundle.value : this.appBundle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('appBundle: $appBundle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, appBundle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.appBundle == this.appBundle);
}

class BankTableCompanion extends UpdateCompanion<BankTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> appBundle;
  const BankTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.appBundle = const Value.absent(),
  });
  BankTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String appBundle,
  })  : name = Value(name),
        appBundle = Value(appBundle);
  static Insertable<BankTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? appBundle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (appBundle != null) 'app_bundle': appBundle,
    });
  }

  BankTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? appBundle}) {
    return BankTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      appBundle: appBundle ?? this.appBundle,
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
    if (appBundle.present) {
      map['app_bundle'] = Variable<String>(appBundle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('appBundle: $appBundle')
          ..write(')'))
        .toString();
  }
}

class $CardBankRelTableTable extends CardBankRelTable
    with TableInfo<$CardBankRelTableTable, CardBankRelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardBankRelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES card_table (id)'));
  static const VerificationMeta _bankIdMeta = const VerificationMeta('bankId');
  @override
  late final GeneratedColumn<int> bankId = GeneratedColumn<int>(
      'bank_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES bank_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [cardId, bankId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_bank_rel_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CardBankRelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('bank_id')) {
      context.handle(_bankIdMeta,
          bankId.isAcceptableOrUnknown(data['bank_id']!, _bankIdMeta));
    } else if (isInserting) {
      context.missing(_bankIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CardBankRelTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardBankRelTableData(
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      bankId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bank_id'])!,
    );
  }

  @override
  $CardBankRelTableTable createAlias(String alias) {
    return $CardBankRelTableTable(attachedDatabase, alias);
  }
}

class CardBankRelTableData extends DataClass
    implements Insertable<CardBankRelTableData> {
  /// Foreign key to the card table
  final int cardId;

  /// Foreign key to the bank table
  final int bankId;
  const CardBankRelTableData({required this.cardId, required this.bankId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<int>(cardId);
    map['bank_id'] = Variable<int>(bankId);
    return map;
  }

  CardBankRelTableCompanion toCompanion(bool nullToAbsent) {
    return CardBankRelTableCompanion(
      cardId: Value(cardId),
      bankId: Value(bankId),
    );
  }

  factory CardBankRelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardBankRelTableData(
      cardId: serializer.fromJson<int>(json['cardId']),
      bankId: serializer.fromJson<int>(json['bankId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<int>(cardId),
      'bankId': serializer.toJson<int>(bankId),
    };
  }

  CardBankRelTableData copyWith({int? cardId, int? bankId}) =>
      CardBankRelTableData(
        cardId: cardId ?? this.cardId,
        bankId: bankId ?? this.bankId,
      );
  CardBankRelTableData copyWithCompanion(CardBankRelTableCompanion data) {
    return CardBankRelTableData(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      bankId: data.bankId.present ? data.bankId.value : this.bankId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardBankRelTableData(')
          ..write('cardId: $cardId, ')
          ..write('bankId: $bankId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardId, bankId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardBankRelTableData &&
          other.cardId == this.cardId &&
          other.bankId == this.bankId);
}

class CardBankRelTableCompanion extends UpdateCompanion<CardBankRelTableData> {
  final Value<int> cardId;
  final Value<int> bankId;
  final Value<int> rowid;
  const CardBankRelTableCompanion({
    this.cardId = const Value.absent(),
    this.bankId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardBankRelTableCompanion.insert({
    required int cardId,
    required int bankId,
    this.rowid = const Value.absent(),
  })  : cardId = Value(cardId),
        bankId = Value(bankId);
  static Insertable<CardBankRelTableData> custom({
    Expression<int>? cardId,
    Expression<int>? bankId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (bankId != null) 'bank_id': bankId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardBankRelTableCompanion copyWith(
      {Value<int>? cardId, Value<int>? bankId, Value<int>? rowid}) {
    return CardBankRelTableCompanion(
      cardId: cardId ?? this.cardId,
      bankId: bankId ?? this.bankId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (bankId.present) {
      map['bank_id'] = Variable<int>(bankId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardBankRelTableCompanion(')
          ..write('cardId: $cardId, ')
          ..write('bankId: $bankId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LogoTableTable extends LogoTable
    with TableInfo<$LogoTableTable, LogoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogoTableTable(this.attachedDatabase, [this._alias]);
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
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<LogoCategoryEnum, int> category =
      GeneratedColumn<int>('category', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LogoCategoryEnum>($LogoTableTable.$convertercategory);
  @override
  List<GeneratedColumn> get $columns => [id, name, path, url, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'logo_table';
  @override
  VerificationContext validateIntegrity(Insertable<LogoTableData> instance,
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
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    context.handle(_categoryMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      category: $LogoTableTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!),
    );
  }

  @override
  $LogoTableTable createAlias(String alias) {
    return $LogoTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogoCategoryEnum, int, int> $convertercategory =
      const EnumIndexConverter<LogoCategoryEnum>(LogoCategoryEnum.values);
}

class LogoTableData extends DataClass implements Insertable<LogoTableData> {
  /// Unique identifier of the logo
  final int id;

  /// Name of the logo
  final String name;

  /// Path of the logo
  final String? path;

  /// Url of the logo
  final String url;

  /// Category of the logo
  final LogoCategoryEnum category;
  const LogoTableData(
      {required this.id,
      required this.name,
      this.path,
      required this.url,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    map['url'] = Variable<String>(url);
    {
      map['category'] =
          Variable<int>($LogoTableTable.$convertercategory.toSql(category));
    }
    return map;
  }

  LogoTableCompanion toCompanion(bool nullToAbsent) {
    return LogoTableCompanion(
      id: Value(id),
      name: Value(name),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      url: Value(url),
      category: Value(category),
    );
  }

  factory LogoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogoTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      path: serializer.fromJson<String?>(json['path']),
      url: serializer.fromJson<String>(json['url']),
      category: $LogoTableTable.$convertercategory
          .fromJson(serializer.fromJson<int>(json['category'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'path': serializer.toJson<String?>(path),
      'url': serializer.toJson<String>(url),
      'category': serializer
          .toJson<int>($LogoTableTable.$convertercategory.toJson(category)),
    };
  }

  LogoTableData copyWith(
          {int? id,
          String? name,
          Value<String?> path = const Value.absent(),
          String? url,
          LogoCategoryEnum? category}) =>
      LogoTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        path: path.present ? path.value : this.path,
        url: url ?? this.url,
        category: category ?? this.category,
      );
  LogoTableData copyWithCompanion(LogoTableCompanion data) {
    return LogoTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      path: data.path.present ? data.path.value : this.path,
      url: data.url.present ? data.url.value : this.url,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogoTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('url: $url, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, path, url, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogoTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.path == this.path &&
          other.url == this.url &&
          other.category == this.category);
}

class LogoTableCompanion extends UpdateCompanion<LogoTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> path;
  final Value<String> url;
  final Value<LogoCategoryEnum> category;
  const LogoTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.path = const Value.absent(),
    this.url = const Value.absent(),
    this.category = const Value.absent(),
  });
  LogoTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.path = const Value.absent(),
    required String url,
    required LogoCategoryEnum category,
  })  : name = Value(name),
        url = Value(url),
        category = Value(category);
  static Insertable<LogoTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? path,
    Expression<String>? url,
    Expression<int>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (url != null) 'url': url,
      if (category != null) 'category': category,
    });
  }

  LogoTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? path,
      Value<String>? url,
      Value<LogoCategoryEnum>? category}) {
    return LogoTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      url: url ?? this.url,
      category: category ?? this.category,
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
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(
          $LogoTableTable.$convertercategory.toSql(category.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogoTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('url: $url, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $IssuerLogoRelTable extends IssuerLogoRel
    with TableInfo<$IssuerLogoRelTable, IssuerLogoRelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssuerLogoRelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _issuerIdMeta =
      const VerificationMeta('issuerId');
  @override
  late final GeneratedColumn<int> issuerId = GeneratedColumn<int>(
      'issuer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES issuer_table (id)'));
  static const VerificationMeta _logoIdMeta = const VerificationMeta('logoId');
  @override
  late final GeneratedColumn<int> logoId = GeneratedColumn<int>(
      'logo_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES logo_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [issuerId, logoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'issuer_logo_rel';
  @override
  VerificationContext validateIntegrity(Insertable<IssuerLogoRelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('issuer_id')) {
      context.handle(_issuerIdMeta,
          issuerId.isAcceptableOrUnknown(data['issuer_id']!, _issuerIdMeta));
    } else if (isInserting) {
      context.missing(_issuerIdMeta);
    }
    if (data.containsKey('logo_id')) {
      context.handle(_logoIdMeta,
          logoId.isAcceptableOrUnknown(data['logo_id']!, _logoIdMeta));
    } else if (isInserting) {
      context.missing(_logoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  IssuerLogoRelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IssuerLogoRelData(
      issuerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}issuer_id'])!,
      logoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}logo_id'])!,
    );
  }

  @override
  $IssuerLogoRelTable createAlias(String alias) {
    return $IssuerLogoRelTable(attachedDatabase, alias);
  }
}

class IssuerLogoRelData extends DataClass
    implements Insertable<IssuerLogoRelData> {
  /// Foreign key to the issuer table
  final int issuerId;

  /// Foreign key to the logo table
  final int logoId;
  const IssuerLogoRelData({required this.issuerId, required this.logoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['issuer_id'] = Variable<int>(issuerId);
    map['logo_id'] = Variable<int>(logoId);
    return map;
  }

  IssuerLogoRelCompanion toCompanion(bool nullToAbsent) {
    return IssuerLogoRelCompanion(
      issuerId: Value(issuerId),
      logoId: Value(logoId),
    );
  }

  factory IssuerLogoRelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IssuerLogoRelData(
      issuerId: serializer.fromJson<int>(json['issuerId']),
      logoId: serializer.fromJson<int>(json['logoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'issuerId': serializer.toJson<int>(issuerId),
      'logoId': serializer.toJson<int>(logoId),
    };
  }

  IssuerLogoRelData copyWith({int? issuerId, int? logoId}) => IssuerLogoRelData(
        issuerId: issuerId ?? this.issuerId,
        logoId: logoId ?? this.logoId,
      );
  IssuerLogoRelData copyWithCompanion(IssuerLogoRelCompanion data) {
    return IssuerLogoRelData(
      issuerId: data.issuerId.present ? data.issuerId.value : this.issuerId,
      logoId: data.logoId.present ? data.logoId.value : this.logoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IssuerLogoRelData(')
          ..write('issuerId: $issuerId, ')
          ..write('logoId: $logoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(issuerId, logoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IssuerLogoRelData &&
          other.issuerId == this.issuerId &&
          other.logoId == this.logoId);
}

class IssuerLogoRelCompanion extends UpdateCompanion<IssuerLogoRelData> {
  final Value<int> issuerId;
  final Value<int> logoId;
  final Value<int> rowid;
  const IssuerLogoRelCompanion({
    this.issuerId = const Value.absent(),
    this.logoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IssuerLogoRelCompanion.insert({
    required int issuerId,
    required int logoId,
    this.rowid = const Value.absent(),
  })  : issuerId = Value(issuerId),
        logoId = Value(logoId);
  static Insertable<IssuerLogoRelData> custom({
    Expression<int>? issuerId,
    Expression<int>? logoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (issuerId != null) 'issuer_id': issuerId,
      if (logoId != null) 'logo_id': logoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IssuerLogoRelCompanion copyWith(
      {Value<int>? issuerId, Value<int>? logoId, Value<int>? rowid}) {
    return IssuerLogoRelCompanion(
      issuerId: issuerId ?? this.issuerId,
      logoId: logoId ?? this.logoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (issuerId.present) {
      map['issuer_id'] = Variable<int>(issuerId.value);
    }
    if (logoId.present) {
      map['logo_id'] = Variable<int>(logoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssuerLogoRelCompanion(')
          ..write('issuerId: $issuerId, ')
          ..write('logoId: $logoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BankLogoRelTable extends BankLogoRel
    with TableInfo<$BankLogoRelTable, BankLogoRelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankLogoRelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bankIdMeta = const VerificationMeta('bankId');
  @override
  late final GeneratedColumn<int> bankId = GeneratedColumn<int>(
      'bank_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES bank_table (id)'));
  static const VerificationMeta _logoIdMeta = const VerificationMeta('logoId');
  @override
  late final GeneratedColumn<int> logoId = GeneratedColumn<int>(
      'logo_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES logo_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [bankId, logoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_logo_rel';
  @override
  VerificationContext validateIntegrity(Insertable<BankLogoRelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bank_id')) {
      context.handle(_bankIdMeta,
          bankId.isAcceptableOrUnknown(data['bank_id']!, _bankIdMeta));
    } else if (isInserting) {
      context.missing(_bankIdMeta);
    }
    if (data.containsKey('logo_id')) {
      context.handle(_logoIdMeta,
          logoId.isAcceptableOrUnknown(data['logo_id']!, _logoIdMeta));
    } else if (isInserting) {
      context.missing(_logoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  BankLogoRelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankLogoRelData(
      bankId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bank_id'])!,
      logoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}logo_id'])!,
    );
  }

  @override
  $BankLogoRelTable createAlias(String alias) {
    return $BankLogoRelTable(attachedDatabase, alias);
  }
}

class BankLogoRelData extends DataClass implements Insertable<BankLogoRelData> {
  /// Foreign key to the bank table
  final int bankId;

  /// Foreign key to the logo table
  final int logoId;
  const BankLogoRelData({required this.bankId, required this.logoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bank_id'] = Variable<int>(bankId);
    map['logo_id'] = Variable<int>(logoId);
    return map;
  }

  BankLogoRelCompanion toCompanion(bool nullToAbsent) {
    return BankLogoRelCompanion(
      bankId: Value(bankId),
      logoId: Value(logoId),
    );
  }

  factory BankLogoRelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankLogoRelData(
      bankId: serializer.fromJson<int>(json['bankId']),
      logoId: serializer.fromJson<int>(json['logoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bankId': serializer.toJson<int>(bankId),
      'logoId': serializer.toJson<int>(logoId),
    };
  }

  BankLogoRelData copyWith({int? bankId, int? logoId}) => BankLogoRelData(
        bankId: bankId ?? this.bankId,
        logoId: logoId ?? this.logoId,
      );
  BankLogoRelData copyWithCompanion(BankLogoRelCompanion data) {
    return BankLogoRelData(
      bankId: data.bankId.present ? data.bankId.value : this.bankId,
      logoId: data.logoId.present ? data.logoId.value : this.logoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankLogoRelData(')
          ..write('bankId: $bankId, ')
          ..write('logoId: $logoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bankId, logoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankLogoRelData &&
          other.bankId == this.bankId &&
          other.logoId == this.logoId);
}

class BankLogoRelCompanion extends UpdateCompanion<BankLogoRelData> {
  final Value<int> bankId;
  final Value<int> logoId;
  final Value<int> rowid;
  const BankLogoRelCompanion({
    this.bankId = const Value.absent(),
    this.logoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankLogoRelCompanion.insert({
    required int bankId,
    required int logoId,
    this.rowid = const Value.absent(),
  })  : bankId = Value(bankId),
        logoId = Value(logoId);
  static Insertable<BankLogoRelData> custom({
    Expression<int>? bankId,
    Expression<int>? logoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bankId != null) 'bank_id': bankId,
      if (logoId != null) 'logo_id': logoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankLogoRelCompanion copyWith(
      {Value<int>? bankId, Value<int>? logoId, Value<int>? rowid}) {
    return BankLogoRelCompanion(
      bankId: bankId ?? this.bankId,
      logoId: logoId ?? this.logoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bankId.present) {
      map['bank_id'] = Variable<int>(bankId.value);
    }
    if (logoId.present) {
      map['logo_id'] = Variable<int>(logoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankLogoRelCompanion(')
          ..write('bankId: $bankId, ')
          ..write('logoId: $logoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  late final $CardTableTable cardTable = $CardTableTable(this);
  late final $AccountCardRelTableTable accountCardRelTable =
      $AccountCardRelTableTable(this);
  late final $CreditLoanTableTable creditLoanTable =
      $CreditLoanTableTable(this);
  late final $CardCreditRelTableTable cardCreditRelTable =
      $CardCreditRelTableTable(this);
  late final $IssuerTableTable issuerTable = $IssuerTableTable(this);
  late final $CardIssuerRelTableTable cardIssuerRelTable =
      $CardIssuerRelTableTable(this);
  late final $BankTableTable bankTable = $BankTableTable(this);
  late final $CardBankRelTableTable cardBankRelTable =
      $CardBankRelTableTable(this);
  late final $LogoTableTable logoTable = $LogoTableTable(this);
  late final $IssuerLogoRelTable issuerLogoRel = $IssuerLogoRelTable(this);
  late final $BankLogoRelTable bankLogoRel = $BankLogoRelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accountTable,
        cardTable,
        accountCardRelTable,
        creditLoanTable,
        cardCreditRelTable,
        issuerTable,
        cardIssuerRelTable,
        bankTable,
        cardBankRelTable,
        logoTable,
        issuerLogoRel,
        bankLogoRel
      ];
}

typedef $$AccountTableTableCreateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  required String currency,
  Value<AccountTypeEnum> typeId,
});
typedef $$AccountTableTableUpdateCompanionBuilder = AccountTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<String> currency,
  Value<AccountTypeEnum> typeId,
});

final class $$AccountTableTableReferences extends BaseReferences<_$AppDatabase,
    $AccountTableTable, AccountTableData> {
  $$AccountTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountCardRelTableTable,
      List<AccountCardRelTableData>> _accountCardRelTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.accountCardRelTable,
          aliasName: $_aliasNameGenerator(
              db.accountTable.id, db.accountCardRelTable.accountId));

  $$AccountCardRelTableTableProcessedTableManager get accountCardRelTableRefs {
    final manager =
        $$AccountCardRelTableTableTableManager($_db, $_db.accountCardRelTable)
            .filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_accountCardRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountTableTableFilterComposer
    extends Composer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableFilterComposer({
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

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AccountTypeEnum, AccountTypeEnum, int>
      get typeId => $composableBuilder(
          column: $table.typeId,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> accountCardRelTableRefs(
      Expression<bool> Function($$AccountCardRelTableTableFilterComposer f) f) {
    final $$AccountCardRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accountCardRelTable,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountCardRelTableTableFilterComposer(
              $db: $db,
              $table: $db.accountCardRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableOrderingComposer({
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

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get typeId => $composableBuilder(
      column: $table.typeId, builder: (column) => ColumnOrderings(column));
}

class $$AccountTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountTableTable> {
  $$AccountTableTableAnnotationComposer({
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

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountTypeEnum, int> get typeId =>
      $composableBuilder(column: $table.typeId, builder: (column) => column);

  Expression<T> accountCardRelTableRefs<T extends Object>(
      Expression<T> Function($$AccountCardRelTableTableAnnotationComposer a)
          f) {
    final $$AccountCardRelTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.accountCardRelTable,
            getReferencedColumn: (t) => t.accountId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$AccountCardRelTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.accountCardRelTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$AccountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountTableTable,
    AccountTableData,
    $$AccountTableTableFilterComposer,
    $$AccountTableTableOrderingComposer,
    $$AccountTableTableAnnotationComposer,
    $$AccountTableTableCreateCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder,
    (AccountTableData, $$AccountTableTableReferences),
    AccountTableData,
    PrefetchHooks Function({bool accountCardRelTableRefs})> {
  $$AccountTableTableTableManager(_$AppDatabase db, $AccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<AccountTypeEnum> typeId = const Value.absent(),
          }) =>
              AccountTableCompanion(
            id: id,
            name: name,
            color: color,
            currency: currency,
            typeId: typeId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> color = const Value.absent(),
            required String currency,
            Value<AccountTypeEnum> typeId = const Value.absent(),
          }) =>
              AccountTableCompanion.insert(
            id: id,
            name: name,
            color: color,
            currency: currency,
            typeId: typeId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AccountTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({accountCardRelTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (accountCardRelTableRefs) db.accountCardRelTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountCardRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AccountTableTableReferences
                            ._accountCardRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountTableTableReferences(db, table, p0)
                                .accountCardRelTableRefs,
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
    $$AccountTableTableAnnotationComposer,
    $$AccountTableTableCreateCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder,
    (AccountTableData, $$AccountTableTableReferences),
    AccountTableData,
    PrefetchHooks Function({bool accountCardRelTableRefs})>;
typedef $$CardTableTableCreateCompanionBuilder = CardTableCompanion Function({
  Value<int> id,
  required String number,
  Value<BankCardTypeEnum> typeId,
});
typedef $$CardTableTableUpdateCompanionBuilder = CardTableCompanion Function({
  Value<int> id,
  Value<String> number,
  Value<BankCardTypeEnum> typeId,
});

final class $$CardTableTableReferences
    extends BaseReferences<_$AppDatabase, $CardTableTable, CardTableData> {
  $$CardTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountCardRelTableTable,
      List<AccountCardRelTableData>> _accountCardRelTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.accountCardRelTable,
          aliasName: $_aliasNameGenerator(
              db.cardTable.id, db.accountCardRelTable.cardId));

  $$AccountCardRelTableTableProcessedTableManager get accountCardRelTableRefs {
    final manager =
        $$AccountCardRelTableTableTableManager($_db, $_db.accountCardRelTable)
            .filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_accountCardRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CardCreditRelTableTable,
      List<CardCreditRelTableData>> _cardCreditRelTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.cardCreditRelTable,
          aliasName: $_aliasNameGenerator(
              db.cardTable.id, db.cardCreditRelTable.cardId));

  $$CardCreditRelTableTableProcessedTableManager get cardCreditRelTableRefs {
    final manager =
        $$CardCreditRelTableTableTableManager($_db, $_db.cardCreditRelTable)
            .filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cardCreditRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CardIssuerRelTableTable,
      List<CardIssuerRelTableData>> _cardIssuerRelTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.cardIssuerRelTable,
          aliasName: $_aliasNameGenerator(
              db.cardTable.id, db.cardIssuerRelTable.cardId));

  $$CardIssuerRelTableTableProcessedTableManager get cardIssuerRelTableRefs {
    final manager =
        $$CardIssuerRelTableTableTableManager($_db, $_db.cardIssuerRelTable)
            .filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cardIssuerRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CardBankRelTableTable, List<CardBankRelTableData>>
      _cardBankRelTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.cardBankRelTable,
              aliasName: $_aliasNameGenerator(
                  db.cardTable.id, db.cardBankRelTable.cardId));

  $$CardBankRelTableTableProcessedTableManager get cardBankRelTableRefs {
    final manager =
        $$CardBankRelTableTableTableManager($_db, $_db.cardBankRelTable)
            .filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cardBankRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CardTableTableFilterComposer
    extends Composer<_$AppDatabase, $CardTableTable> {
  $$CardTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<BankCardTypeEnum, BankCardTypeEnum, int>
      get typeId => $composableBuilder(
          column: $table.typeId,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> accountCardRelTableRefs(
      Expression<bool> Function($$AccountCardRelTableTableFilterComposer f) f) {
    final $$AccountCardRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accountCardRelTable,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountCardRelTableTableFilterComposer(
              $db: $db,
              $table: $db.accountCardRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> cardCreditRelTableRefs(
      Expression<bool> Function($$CardCreditRelTableTableFilterComposer f) f) {
    final $$CardCreditRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardCreditRelTable,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardCreditRelTableTableFilterComposer(
              $db: $db,
              $table: $db.cardCreditRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> cardIssuerRelTableRefs(
      Expression<bool> Function($$CardIssuerRelTableTableFilterComposer f) f) {
    final $$CardIssuerRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardIssuerRelTable,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardIssuerRelTableTableFilterComposer(
              $db: $db,
              $table: $db.cardIssuerRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> cardBankRelTableRefs(
      Expression<bool> Function($$CardBankRelTableTableFilterComposer f) f) {
    final $$CardBankRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardBankRelTable,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardBankRelTableTableFilterComposer(
              $db: $db,
              $table: $db.cardBankRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CardTableTable> {
  $$CardTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get typeId => $composableBuilder(
      column: $table.typeId, builder: (column) => ColumnOrderings(column));
}

class $$CardTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardTableTable> {
  $$CardTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BankCardTypeEnum, int> get typeId =>
      $composableBuilder(column: $table.typeId, builder: (column) => column);

  Expression<T> accountCardRelTableRefs<T extends Object>(
      Expression<T> Function($$AccountCardRelTableTableAnnotationComposer a)
          f) {
    final $$AccountCardRelTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.accountCardRelTable,
            getReferencedColumn: (t) => t.cardId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$AccountCardRelTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.accountCardRelTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> cardCreditRelTableRefs<T extends Object>(
      Expression<T> Function($$CardCreditRelTableTableAnnotationComposer a) f) {
    final $$CardCreditRelTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.cardCreditRelTable,
            getReferencedColumn: (t) => t.cardId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CardCreditRelTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.cardCreditRelTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> cardIssuerRelTableRefs<T extends Object>(
      Expression<T> Function($$CardIssuerRelTableTableAnnotationComposer a) f) {
    final $$CardIssuerRelTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.cardIssuerRelTable,
            getReferencedColumn: (t) => t.cardId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CardIssuerRelTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.cardIssuerRelTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> cardBankRelTableRefs<T extends Object>(
      Expression<T> Function($$CardBankRelTableTableAnnotationComposer a) f) {
    final $$CardBankRelTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardBankRelTable,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardBankRelTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cardBankRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardTableTable,
    CardTableData,
    $$CardTableTableFilterComposer,
    $$CardTableTableOrderingComposer,
    $$CardTableTableAnnotationComposer,
    $$CardTableTableCreateCompanionBuilder,
    $$CardTableTableUpdateCompanionBuilder,
    (CardTableData, $$CardTableTableReferences),
    CardTableData,
    PrefetchHooks Function(
        {bool accountCardRelTableRefs,
        bool cardCreditRelTableRefs,
        bool cardIssuerRelTableRefs,
        bool cardBankRelTableRefs})> {
  $$CardTableTableTableManager(_$AppDatabase db, $CardTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> number = const Value.absent(),
            Value<BankCardTypeEnum> typeId = const Value.absent(),
          }) =>
              CardTableCompanion(
            id: id,
            number: number,
            typeId: typeId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String number,
            Value<BankCardTypeEnum> typeId = const Value.absent(),
          }) =>
              CardTableCompanion.insert(
            id: id,
            number: number,
            typeId: typeId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CardTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {accountCardRelTableRefs = false,
              cardCreditRelTableRefs = false,
              cardIssuerRelTableRefs = false,
              cardBankRelTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (accountCardRelTableRefs) db.accountCardRelTable,
                if (cardCreditRelTableRefs) db.cardCreditRelTable,
                if (cardIssuerRelTableRefs) db.cardIssuerRelTable,
                if (cardBankRelTableRefs) db.cardBankRelTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountCardRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CardTableTableReferences
                            ._accountCardRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardTableTableReferences(db, table, p0)
                                .accountCardRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items),
                  if (cardCreditRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CardTableTableReferences
                            ._cardCreditRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardTableTableReferences(db, table, p0)
                                .cardCreditRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items),
                  if (cardIssuerRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CardTableTableReferences
                            ._cardIssuerRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardTableTableReferences(db, table, p0)
                                .cardIssuerRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items),
                  if (cardBankRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CardTableTableReferences
                            ._cardBankRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardTableTableReferences(db, table, p0)
                                .cardBankRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CardTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardTableTable,
    CardTableData,
    $$CardTableTableFilterComposer,
    $$CardTableTableOrderingComposer,
    $$CardTableTableAnnotationComposer,
    $$CardTableTableCreateCompanionBuilder,
    $$CardTableTableUpdateCompanionBuilder,
    (CardTableData, $$CardTableTableReferences),
    CardTableData,
    PrefetchHooks Function(
        {bool accountCardRelTableRefs,
        bool cardCreditRelTableRefs,
        bool cardIssuerRelTableRefs,
        bool cardBankRelTableRefs})>;
typedef $$AccountCardRelTableTableCreateCompanionBuilder
    = AccountCardRelTableCompanion Function({
  required int accountId,
  required int cardId,
  Value<int> rowid,
});
typedef $$AccountCardRelTableTableUpdateCompanionBuilder
    = AccountCardRelTableCompanion Function({
  Value<int> accountId,
  Value<int> cardId,
  Value<int> rowid,
});

final class $$AccountCardRelTableTableReferences extends BaseReferences<
    _$AppDatabase, $AccountCardRelTableTable, AccountCardRelTableData> {
  $$AccountCardRelTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AccountTableTable _accountIdTable(_$AppDatabase db) =>
      db.accountTable.createAlias($_aliasNameGenerator(
          db.accountCardRelTable.accountId, db.accountTable.id));

  $$AccountTableTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountTableTableTableManager($_db, $_db.accountTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CardTableTable _cardIdTable(_$AppDatabase db) =>
      db.cardTable.createAlias(
          $_aliasNameGenerator(db.accountCardRelTable.cardId, db.cardTable.id));

  $$CardTableTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardTableTableTableManager($_db, $_db.cardTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AccountCardRelTableTableFilterComposer
    extends Composer<_$AppDatabase, $AccountCardRelTableTable> {
  $$AccountCardRelTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableTableFilterComposer get accountId {
    final $$AccountTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accountTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountTableTableFilterComposer(
              $db: $db,
              $table: $db.accountTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CardTableTableFilterComposer get cardId {
    final $$CardTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableFilterComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountCardRelTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountCardRelTableTable> {
  $$AccountCardRelTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableTableOrderingComposer get accountId {
    final $$AccountTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accountTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountTableTableOrderingComposer(
              $db: $db,
              $table: $db.accountTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CardTableTableOrderingComposer get cardId {
    final $$CardTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableOrderingComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountCardRelTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountCardRelTableTable> {
  $$AccountCardRelTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AccountTableTableAnnotationComposer get accountId {
    final $$AccountTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accountTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountTableTableAnnotationComposer(
              $db: $db,
              $table: $db.accountTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CardTableTableAnnotationComposer get cardId {
    final $$CardTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountCardRelTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountCardRelTableTable,
    AccountCardRelTableData,
    $$AccountCardRelTableTableFilterComposer,
    $$AccountCardRelTableTableOrderingComposer,
    $$AccountCardRelTableTableAnnotationComposer,
    $$AccountCardRelTableTableCreateCompanionBuilder,
    $$AccountCardRelTableTableUpdateCompanionBuilder,
    (AccountCardRelTableData, $$AccountCardRelTableTableReferences),
    AccountCardRelTableData,
    PrefetchHooks Function({bool accountId, bool cardId})> {
  $$AccountCardRelTableTableTableManager(
      _$AppDatabase db, $AccountCardRelTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountCardRelTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountCardRelTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountCardRelTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> accountId = const Value.absent(),
            Value<int> cardId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountCardRelTableCompanion(
            accountId: accountId,
            cardId: cardId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int accountId,
            required int cardId,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountCardRelTableCompanion.insert(
            accountId: accountId,
            cardId: cardId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AccountCardRelTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({accountId = false, cardId = false}) {
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
                      dynamic,
                      dynamic>>(state) {
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable: $$AccountCardRelTableTableReferences
                        ._accountIdTable(db),
                    referencedColumn: $$AccountCardRelTableTableReferences
                        ._accountIdTable(db)
                        .id,
                  ) as T;
                }
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$AccountCardRelTableTableReferences._cardIdTable(db),
                    referencedColumn: $$AccountCardRelTableTableReferences
                        ._cardIdTable(db)
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

typedef $$AccountCardRelTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountCardRelTableTable,
    AccountCardRelTableData,
    $$AccountCardRelTableTableFilterComposer,
    $$AccountCardRelTableTableOrderingComposer,
    $$AccountCardRelTableTableAnnotationComposer,
    $$AccountCardRelTableTableCreateCompanionBuilder,
    $$AccountCardRelTableTableUpdateCompanionBuilder,
    (AccountCardRelTableData, $$AccountCardRelTableTableReferences),
    AccountCardRelTableData,
    PrefetchHooks Function({bool accountId, bool cardId})>;
typedef $$CreditLoanTableTableCreateCompanionBuilder = CreditLoanTableCompanion
    Function({
  Value<int> id,
  required double amount,
  required double monthlyInterestRate,
  required DateTime statementClosingDate,
  required DateTime statementPaymentDate,
});
typedef $$CreditLoanTableTableUpdateCompanionBuilder = CreditLoanTableCompanion
    Function({
  Value<int> id,
  Value<double> amount,
  Value<double> monthlyInterestRate,
  Value<DateTime> statementClosingDate,
  Value<DateTime> statementPaymentDate,
});

final class $$CreditLoanTableTableReferences extends BaseReferences<
    _$AppDatabase, $CreditLoanTableTable, CreditLoanTableData> {
  $$CreditLoanTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CardCreditRelTableTable,
      List<CardCreditRelTableData>> _cardCreditRelTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.cardCreditRelTable,
          aliasName: $_aliasNameGenerator(
              db.creditLoanTable.id, db.cardCreditRelTable.creditId));

  $$CardCreditRelTableTableProcessedTableManager get cardCreditRelTableRefs {
    final manager =
        $$CardCreditRelTableTableTableManager($_db, $_db.cardCreditRelTable)
            .filter((f) => f.creditId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cardCreditRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CreditLoanTableTableFilterComposer
    extends Composer<_$AppDatabase, $CreditLoanTableTable> {
  $$CreditLoanTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get monthlyInterestRate => $composableBuilder(
      column: $table.monthlyInterestRate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get statementClosingDate => $composableBuilder(
      column: $table.statementClosingDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get statementPaymentDate => $composableBuilder(
      column: $table.statementPaymentDate,
      builder: (column) => ColumnFilters(column));

  Expression<bool> cardCreditRelTableRefs(
      Expression<bool> Function($$CardCreditRelTableTableFilterComposer f) f) {
    final $$CardCreditRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardCreditRelTable,
        getReferencedColumn: (t) => t.creditId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardCreditRelTableTableFilterComposer(
              $db: $db,
              $table: $db.cardCreditRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CreditLoanTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditLoanTableTable> {
  $$CreditLoanTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get monthlyInterestRate => $composableBuilder(
      column: $table.monthlyInterestRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get statementClosingDate => $composableBuilder(
      column: $table.statementClosingDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get statementPaymentDate => $composableBuilder(
      column: $table.statementPaymentDate,
      builder: (column) => ColumnOrderings(column));
}

class $$CreditLoanTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditLoanTableTable> {
  $$CreditLoanTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get monthlyInterestRate => $composableBuilder(
      column: $table.monthlyInterestRate, builder: (column) => column);

  GeneratedColumn<DateTime> get statementClosingDate => $composableBuilder(
      column: $table.statementClosingDate, builder: (column) => column);

  GeneratedColumn<DateTime> get statementPaymentDate => $composableBuilder(
      column: $table.statementPaymentDate, builder: (column) => column);

  Expression<T> cardCreditRelTableRefs<T extends Object>(
      Expression<T> Function($$CardCreditRelTableTableAnnotationComposer a) f) {
    final $$CardCreditRelTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.cardCreditRelTable,
            getReferencedColumn: (t) => t.creditId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CardCreditRelTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.cardCreditRelTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CreditLoanTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CreditLoanTableTable,
    CreditLoanTableData,
    $$CreditLoanTableTableFilterComposer,
    $$CreditLoanTableTableOrderingComposer,
    $$CreditLoanTableTableAnnotationComposer,
    $$CreditLoanTableTableCreateCompanionBuilder,
    $$CreditLoanTableTableUpdateCompanionBuilder,
    (CreditLoanTableData, $$CreditLoanTableTableReferences),
    CreditLoanTableData,
    PrefetchHooks Function({bool cardCreditRelTableRefs})> {
  $$CreditLoanTableTableTableManager(
      _$AppDatabase db, $CreditLoanTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditLoanTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditLoanTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditLoanTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<double> monthlyInterestRate = const Value.absent(),
            Value<DateTime> statementClosingDate = const Value.absent(),
            Value<DateTime> statementPaymentDate = const Value.absent(),
          }) =>
              CreditLoanTableCompanion(
            id: id,
            amount: amount,
            monthlyInterestRate: monthlyInterestRate,
            statementClosingDate: statementClosingDate,
            statementPaymentDate: statementPaymentDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double amount,
            required double monthlyInterestRate,
            required DateTime statementClosingDate,
            required DateTime statementPaymentDate,
          }) =>
              CreditLoanTableCompanion.insert(
            id: id,
            amount: amount,
            monthlyInterestRate: monthlyInterestRate,
            statementClosingDate: statementClosingDate,
            statementPaymentDate: statementPaymentDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CreditLoanTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardCreditRelTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cardCreditRelTableRefs) db.cardCreditRelTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardCreditRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CreditLoanTableTableReferences
                            ._cardCreditRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CreditLoanTableTableReferences(db, table, p0)
                                .cardCreditRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.creditId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CreditLoanTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CreditLoanTableTable,
    CreditLoanTableData,
    $$CreditLoanTableTableFilterComposer,
    $$CreditLoanTableTableOrderingComposer,
    $$CreditLoanTableTableAnnotationComposer,
    $$CreditLoanTableTableCreateCompanionBuilder,
    $$CreditLoanTableTableUpdateCompanionBuilder,
    (CreditLoanTableData, $$CreditLoanTableTableReferences),
    CreditLoanTableData,
    PrefetchHooks Function({bool cardCreditRelTableRefs})>;
typedef $$CardCreditRelTableTableCreateCompanionBuilder
    = CardCreditRelTableCompanion Function({
  required int cardId,
  required int creditId,
  Value<int> rowid,
});
typedef $$CardCreditRelTableTableUpdateCompanionBuilder
    = CardCreditRelTableCompanion Function({
  Value<int> cardId,
  Value<int> creditId,
  Value<int> rowid,
});

final class $$CardCreditRelTableTableReferences extends BaseReferences<
    _$AppDatabase, $CardCreditRelTableTable, CardCreditRelTableData> {
  $$CardCreditRelTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardTableTable _cardIdTable(_$AppDatabase db) =>
      db.cardTable.createAlias(
          $_aliasNameGenerator(db.cardCreditRelTable.cardId, db.cardTable.id));

  $$CardTableTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardTableTableTableManager($_db, $_db.cardTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CreditLoanTableTable _creditIdTable(_$AppDatabase db) =>
      db.creditLoanTable.createAlias($_aliasNameGenerator(
          db.cardCreditRelTable.creditId, db.creditLoanTable.id));

  $$CreditLoanTableTableProcessedTableManager get creditId {
    final $_column = $_itemColumn<int>('credit_id')!;

    final manager =
        $$CreditLoanTableTableTableManager($_db, $_db.creditLoanTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_creditIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CardCreditRelTableTableFilterComposer
    extends Composer<_$AppDatabase, $CardCreditRelTableTable> {
  $$CardCreditRelTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableFilterComposer get cardId {
    final $$CardTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableFilterComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CreditLoanTableTableFilterComposer get creditId {
    final $$CreditLoanTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creditId,
        referencedTable: $db.creditLoanTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CreditLoanTableTableFilterComposer(
              $db: $db,
              $table: $db.creditLoanTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardCreditRelTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CardCreditRelTableTable> {
  $$CardCreditRelTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableOrderingComposer get cardId {
    final $$CardTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableOrderingComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CreditLoanTableTableOrderingComposer get creditId {
    final $$CreditLoanTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creditId,
        referencedTable: $db.creditLoanTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CreditLoanTableTableOrderingComposer(
              $db: $db,
              $table: $db.creditLoanTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardCreditRelTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardCreditRelTableTable> {
  $$CardCreditRelTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableAnnotationComposer get cardId {
    final $$CardTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CreditLoanTableTableAnnotationComposer get creditId {
    final $$CreditLoanTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.creditId,
        referencedTable: $db.creditLoanTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CreditLoanTableTableAnnotationComposer(
              $db: $db,
              $table: $db.creditLoanTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardCreditRelTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardCreditRelTableTable,
    CardCreditRelTableData,
    $$CardCreditRelTableTableFilterComposer,
    $$CardCreditRelTableTableOrderingComposer,
    $$CardCreditRelTableTableAnnotationComposer,
    $$CardCreditRelTableTableCreateCompanionBuilder,
    $$CardCreditRelTableTableUpdateCompanionBuilder,
    (CardCreditRelTableData, $$CardCreditRelTableTableReferences),
    CardCreditRelTableData,
    PrefetchHooks Function({bool cardId, bool creditId})> {
  $$CardCreditRelTableTableTableManager(
      _$AppDatabase db, $CardCreditRelTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardCreditRelTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardCreditRelTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardCreditRelTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> cardId = const Value.absent(),
            Value<int> creditId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardCreditRelTableCompanion(
            cardId: cardId,
            creditId: creditId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int cardId,
            required int creditId,
            Value<int> rowid = const Value.absent(),
          }) =>
              CardCreditRelTableCompanion.insert(
            cardId: cardId,
            creditId: creditId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CardCreditRelTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false, creditId = false}) {
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
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$CardCreditRelTableTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$CardCreditRelTableTableReferences._cardIdTable(db).id,
                  ) as T;
                }
                if (creditId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.creditId,
                    referencedTable:
                        $$CardCreditRelTableTableReferences._creditIdTable(db),
                    referencedColumn: $$CardCreditRelTableTableReferences
                        ._creditIdTable(db)
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

typedef $$CardCreditRelTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardCreditRelTableTable,
    CardCreditRelTableData,
    $$CardCreditRelTableTableFilterComposer,
    $$CardCreditRelTableTableOrderingComposer,
    $$CardCreditRelTableTableAnnotationComposer,
    $$CardCreditRelTableTableCreateCompanionBuilder,
    $$CardCreditRelTableTableUpdateCompanionBuilder,
    (CardCreditRelTableData, $$CardCreditRelTableTableReferences),
    CardCreditRelTableData,
    PrefetchHooks Function({bool cardId, bool creditId})>;
typedef $$IssuerTableTableCreateCompanionBuilder = IssuerTableCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$IssuerTableTableUpdateCompanionBuilder = IssuerTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

final class $$IssuerTableTableReferences
    extends BaseReferences<_$AppDatabase, $IssuerTableTable, IssuerTableData> {
  $$IssuerTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CardIssuerRelTableTable,
      List<CardIssuerRelTableData>> _cardIssuerRelTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.cardIssuerRelTable,
          aliasName: $_aliasNameGenerator(
              db.issuerTable.id, db.cardIssuerRelTable.issuerId));

  $$CardIssuerRelTableTableProcessedTableManager get cardIssuerRelTableRefs {
    final manager =
        $$CardIssuerRelTableTableTableManager($_db, $_db.cardIssuerRelTable)
            .filter((f) => f.issuerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cardIssuerRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$IssuerLogoRelTable, List<IssuerLogoRelData>>
      _issuerLogoRelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.issuerLogoRel,
              aliasName: $_aliasNameGenerator(
                  db.issuerTable.id, db.issuerLogoRel.issuerId));

  $$IssuerLogoRelTableProcessedTableManager get issuerLogoRelRefs {
    final manager = $$IssuerLogoRelTableTableManager($_db, $_db.issuerLogoRel)
        .filter((f) => f.issuerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issuerLogoRelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$IssuerTableTableFilterComposer
    extends Composer<_$AppDatabase, $IssuerTableTable> {
  $$IssuerTableTableFilterComposer({
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

  Expression<bool> cardIssuerRelTableRefs(
      Expression<bool> Function($$CardIssuerRelTableTableFilterComposer f) f) {
    final $$CardIssuerRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardIssuerRelTable,
        getReferencedColumn: (t) => t.issuerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardIssuerRelTableTableFilterComposer(
              $db: $db,
              $table: $db.cardIssuerRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> issuerLogoRelRefs(
      Expression<bool> Function($$IssuerLogoRelTableFilterComposer f) f) {
    final $$IssuerLogoRelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.issuerLogoRel,
        getReferencedColumn: (t) => t.issuerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerLogoRelTableFilterComposer(
              $db: $db,
              $table: $db.issuerLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IssuerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IssuerTableTable> {
  $$IssuerTableTableOrderingComposer({
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
}

class $$IssuerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IssuerTableTable> {
  $$IssuerTableTableAnnotationComposer({
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

  Expression<T> cardIssuerRelTableRefs<T extends Object>(
      Expression<T> Function($$CardIssuerRelTableTableAnnotationComposer a) f) {
    final $$CardIssuerRelTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.cardIssuerRelTable,
            getReferencedColumn: (t) => t.issuerId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CardIssuerRelTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.cardIssuerRelTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> issuerLogoRelRefs<T extends Object>(
      Expression<T> Function($$IssuerLogoRelTableAnnotationComposer a) f) {
    final $$IssuerLogoRelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.issuerLogoRel,
        getReferencedColumn: (t) => t.issuerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerLogoRelTableAnnotationComposer(
              $db: $db,
              $table: $db.issuerLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IssuerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IssuerTableTable,
    IssuerTableData,
    $$IssuerTableTableFilterComposer,
    $$IssuerTableTableOrderingComposer,
    $$IssuerTableTableAnnotationComposer,
    $$IssuerTableTableCreateCompanionBuilder,
    $$IssuerTableTableUpdateCompanionBuilder,
    (IssuerTableData, $$IssuerTableTableReferences),
    IssuerTableData,
    PrefetchHooks Function(
        {bool cardIssuerRelTableRefs, bool issuerLogoRelRefs})> {
  $$IssuerTableTableTableManager(_$AppDatabase db, $IssuerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IssuerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IssuerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IssuerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              IssuerTableCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              IssuerTableCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IssuerTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {cardIssuerRelTableRefs = false, issuerLogoRelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cardIssuerRelTableRefs) db.cardIssuerRelTable,
                if (issuerLogoRelRefs) db.issuerLogoRel
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardIssuerRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$IssuerTableTableReferences
                            ._cardIssuerRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IssuerTableTableReferences(db, table, p0)
                                .cardIssuerRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.issuerId == item.id),
                        typedResults: items),
                  if (issuerLogoRelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$IssuerTableTableReferences
                            ._issuerLogoRelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IssuerTableTableReferences(db, table, p0)
                                .issuerLogoRelRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.issuerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$IssuerTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IssuerTableTable,
    IssuerTableData,
    $$IssuerTableTableFilterComposer,
    $$IssuerTableTableOrderingComposer,
    $$IssuerTableTableAnnotationComposer,
    $$IssuerTableTableCreateCompanionBuilder,
    $$IssuerTableTableUpdateCompanionBuilder,
    (IssuerTableData, $$IssuerTableTableReferences),
    IssuerTableData,
    PrefetchHooks Function(
        {bool cardIssuerRelTableRefs, bool issuerLogoRelRefs})>;
typedef $$CardIssuerRelTableTableCreateCompanionBuilder
    = CardIssuerRelTableCompanion Function({
  required int cardId,
  required int issuerId,
  Value<int> rowid,
});
typedef $$CardIssuerRelTableTableUpdateCompanionBuilder
    = CardIssuerRelTableCompanion Function({
  Value<int> cardId,
  Value<int> issuerId,
  Value<int> rowid,
});

final class $$CardIssuerRelTableTableReferences extends BaseReferences<
    _$AppDatabase, $CardIssuerRelTableTable, CardIssuerRelTableData> {
  $$CardIssuerRelTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardTableTable _cardIdTable(_$AppDatabase db) =>
      db.cardTable.createAlias(
          $_aliasNameGenerator(db.cardIssuerRelTable.cardId, db.cardTable.id));

  $$CardTableTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardTableTableTableManager($_db, $_db.cardTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $IssuerTableTable _issuerIdTable(_$AppDatabase db) =>
      db.issuerTable.createAlias($_aliasNameGenerator(
          db.cardIssuerRelTable.issuerId, db.issuerTable.id));

  $$IssuerTableTableProcessedTableManager get issuerId {
    final $_column = $_itemColumn<int>('issuer_id')!;

    final manager = $$IssuerTableTableTableManager($_db, $_db.issuerTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_issuerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CardIssuerRelTableTableFilterComposer
    extends Composer<_$AppDatabase, $CardIssuerRelTableTable> {
  $$CardIssuerRelTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableFilterComposer get cardId {
    final $$CardTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableFilterComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IssuerTableTableFilterComposer get issuerId {
    final $$IssuerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.issuerId,
        referencedTable: $db.issuerTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerTableTableFilterComposer(
              $db: $db,
              $table: $db.issuerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardIssuerRelTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CardIssuerRelTableTable> {
  $$CardIssuerRelTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableOrderingComposer get cardId {
    final $$CardTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableOrderingComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IssuerTableTableOrderingComposer get issuerId {
    final $$IssuerTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.issuerId,
        referencedTable: $db.issuerTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerTableTableOrderingComposer(
              $db: $db,
              $table: $db.issuerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardIssuerRelTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardIssuerRelTableTable> {
  $$CardIssuerRelTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableAnnotationComposer get cardId {
    final $$CardTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IssuerTableTableAnnotationComposer get issuerId {
    final $$IssuerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.issuerId,
        referencedTable: $db.issuerTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.issuerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardIssuerRelTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardIssuerRelTableTable,
    CardIssuerRelTableData,
    $$CardIssuerRelTableTableFilterComposer,
    $$CardIssuerRelTableTableOrderingComposer,
    $$CardIssuerRelTableTableAnnotationComposer,
    $$CardIssuerRelTableTableCreateCompanionBuilder,
    $$CardIssuerRelTableTableUpdateCompanionBuilder,
    (CardIssuerRelTableData, $$CardIssuerRelTableTableReferences),
    CardIssuerRelTableData,
    PrefetchHooks Function({bool cardId, bool issuerId})> {
  $$CardIssuerRelTableTableTableManager(
      _$AppDatabase db, $CardIssuerRelTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardIssuerRelTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardIssuerRelTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardIssuerRelTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> cardId = const Value.absent(),
            Value<int> issuerId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardIssuerRelTableCompanion(
            cardId: cardId,
            issuerId: issuerId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int cardId,
            required int issuerId,
            Value<int> rowid = const Value.absent(),
          }) =>
              CardIssuerRelTableCompanion.insert(
            cardId: cardId,
            issuerId: issuerId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CardIssuerRelTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false, issuerId = false}) {
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
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$CardIssuerRelTableTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$CardIssuerRelTableTableReferences._cardIdTable(db).id,
                  ) as T;
                }
                if (issuerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.issuerId,
                    referencedTable:
                        $$CardIssuerRelTableTableReferences._issuerIdTable(db),
                    referencedColumn: $$CardIssuerRelTableTableReferences
                        ._issuerIdTable(db)
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

typedef $$CardIssuerRelTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardIssuerRelTableTable,
    CardIssuerRelTableData,
    $$CardIssuerRelTableTableFilterComposer,
    $$CardIssuerRelTableTableOrderingComposer,
    $$CardIssuerRelTableTableAnnotationComposer,
    $$CardIssuerRelTableTableCreateCompanionBuilder,
    $$CardIssuerRelTableTableUpdateCompanionBuilder,
    (CardIssuerRelTableData, $$CardIssuerRelTableTableReferences),
    CardIssuerRelTableData,
    PrefetchHooks Function({bool cardId, bool issuerId})>;
typedef $$BankTableTableCreateCompanionBuilder = BankTableCompanion Function({
  Value<int> id,
  required String name,
  required String appBundle,
});
typedef $$BankTableTableUpdateCompanionBuilder = BankTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> appBundle,
});

final class $$BankTableTableReferences
    extends BaseReferences<_$AppDatabase, $BankTableTable, BankTableData> {
  $$BankTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CardBankRelTableTable, List<CardBankRelTableData>>
      _cardBankRelTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.cardBankRelTable,
              aliasName: $_aliasNameGenerator(
                  db.bankTable.id, db.cardBankRelTable.bankId));

  $$CardBankRelTableTableProcessedTableManager get cardBankRelTableRefs {
    final manager =
        $$CardBankRelTableTableTableManager($_db, $_db.cardBankRelTable)
            .filter((f) => f.bankId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cardBankRelTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BankLogoRelTable, List<BankLogoRelData>>
      _bankLogoRelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.bankLogoRel,
              aliasName:
                  $_aliasNameGenerator(db.bankTable.id, db.bankLogoRel.bankId));

  $$BankLogoRelTableProcessedTableManager get bankLogoRelRefs {
    final manager = $$BankLogoRelTableTableManager($_db, $_db.bankLogoRel)
        .filter((f) => f.bankId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bankLogoRelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BankTableTableFilterComposer
    extends Composer<_$AppDatabase, $BankTableTable> {
  $$BankTableTableFilterComposer({
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

  ColumnFilters<String> get appBundle => $composableBuilder(
      column: $table.appBundle, builder: (column) => ColumnFilters(column));

  Expression<bool> cardBankRelTableRefs(
      Expression<bool> Function($$CardBankRelTableTableFilterComposer f) f) {
    final $$CardBankRelTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardBankRelTable,
        getReferencedColumn: (t) => t.bankId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardBankRelTableTableFilterComposer(
              $db: $db,
              $table: $db.cardBankRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> bankLogoRelRefs(
      Expression<bool> Function($$BankLogoRelTableFilterComposer f) f) {
    final $$BankLogoRelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.bankLogoRel,
        getReferencedColumn: (t) => t.bankId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankLogoRelTableFilterComposer(
              $db: $db,
              $table: $db.bankLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BankTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BankTableTable> {
  $$BankTableTableOrderingComposer({
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

  ColumnOrderings<String> get appBundle => $composableBuilder(
      column: $table.appBundle, builder: (column) => ColumnOrderings(column));
}

class $$BankTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankTableTable> {
  $$BankTableTableAnnotationComposer({
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

  GeneratedColumn<String> get appBundle =>
      $composableBuilder(column: $table.appBundle, builder: (column) => column);

  Expression<T> cardBankRelTableRefs<T extends Object>(
      Expression<T> Function($$CardBankRelTableTableAnnotationComposer a) f) {
    final $$CardBankRelTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cardBankRelTable,
        getReferencedColumn: (t) => t.bankId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardBankRelTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cardBankRelTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> bankLogoRelRefs<T extends Object>(
      Expression<T> Function($$BankLogoRelTableAnnotationComposer a) f) {
    final $$BankLogoRelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.bankLogoRel,
        getReferencedColumn: (t) => t.bankId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankLogoRelTableAnnotationComposer(
              $db: $db,
              $table: $db.bankLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$BankTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankTableTable,
    BankTableData,
    $$BankTableTableFilterComposer,
    $$BankTableTableOrderingComposer,
    $$BankTableTableAnnotationComposer,
    $$BankTableTableCreateCompanionBuilder,
    $$BankTableTableUpdateCompanionBuilder,
    (BankTableData, $$BankTableTableReferences),
    BankTableData,
    PrefetchHooks Function({bool cardBankRelTableRefs, bool bankLogoRelRefs})> {
  $$BankTableTableTableManager(_$AppDatabase db, $BankTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> appBundle = const Value.absent(),
          }) =>
              BankTableCompanion(
            id: id,
            name: name,
            appBundle: appBundle,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String appBundle,
          }) =>
              BankTableCompanion.insert(
            id: id,
            name: name,
            appBundle: appBundle,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BankTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {cardBankRelTableRefs = false, bankLogoRelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cardBankRelTableRefs) db.cardBankRelTable,
                if (bankLogoRelRefs) db.bankLogoRel
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardBankRelTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$BankTableTableReferences
                            ._cardBankRelTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BankTableTableReferences(db, table, p0)
                                .cardBankRelTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.bankId == item.id),
                        typedResults: items),
                  if (bankLogoRelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$BankTableTableReferences
                            ._bankLogoRelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BankTableTableReferences(db, table, p0)
                                .bankLogoRelRefs,
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
    $$BankTableTableAnnotationComposer,
    $$BankTableTableCreateCompanionBuilder,
    $$BankTableTableUpdateCompanionBuilder,
    (BankTableData, $$BankTableTableReferences),
    BankTableData,
    PrefetchHooks Function({bool cardBankRelTableRefs, bool bankLogoRelRefs})>;
typedef $$CardBankRelTableTableCreateCompanionBuilder
    = CardBankRelTableCompanion Function({
  required int cardId,
  required int bankId,
  Value<int> rowid,
});
typedef $$CardBankRelTableTableUpdateCompanionBuilder
    = CardBankRelTableCompanion Function({
  Value<int> cardId,
  Value<int> bankId,
  Value<int> rowid,
});

final class $$CardBankRelTableTableReferences extends BaseReferences<
    _$AppDatabase, $CardBankRelTableTable, CardBankRelTableData> {
  $$CardBankRelTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardTableTable _cardIdTable(_$AppDatabase db) =>
      db.cardTable.createAlias(
          $_aliasNameGenerator(db.cardBankRelTable.cardId, db.cardTable.id));

  $$CardTableTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardTableTableTableManager($_db, $_db.cardTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $BankTableTable _bankIdTable(_$AppDatabase db) =>
      db.bankTable.createAlias(
          $_aliasNameGenerator(db.cardBankRelTable.bankId, db.bankTable.id));

  $$BankTableTableProcessedTableManager get bankId {
    final $_column = $_itemColumn<int>('bank_id')!;

    final manager = $$BankTableTableTableManager($_db, $_db.bankTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bankIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CardBankRelTableTableFilterComposer
    extends Composer<_$AppDatabase, $CardBankRelTableTable> {
  $$CardBankRelTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableFilterComposer get cardId {
    final $$CardTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableFilterComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BankTableTableFilterComposer get bankId {
    final $$BankTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankTableTableFilterComposer(
              $db: $db,
              $table: $db.bankTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardBankRelTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CardBankRelTableTable> {
  $$CardBankRelTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableOrderingComposer get cardId {
    final $$CardTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableOrderingComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BankTableTableOrderingComposer get bankId {
    final $$BankTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankTableTableOrderingComposer(
              $db: $db,
              $table: $db.bankTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardBankRelTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardBankRelTableTable> {
  $$CardBankRelTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CardTableTableAnnotationComposer get cardId {
    final $$CardTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cardTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cardTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$BankTableTableAnnotationComposer get bankId {
    final $$BankTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bankTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CardBankRelTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardBankRelTableTable,
    CardBankRelTableData,
    $$CardBankRelTableTableFilterComposer,
    $$CardBankRelTableTableOrderingComposer,
    $$CardBankRelTableTableAnnotationComposer,
    $$CardBankRelTableTableCreateCompanionBuilder,
    $$CardBankRelTableTableUpdateCompanionBuilder,
    (CardBankRelTableData, $$CardBankRelTableTableReferences),
    CardBankRelTableData,
    PrefetchHooks Function({bool cardId, bool bankId})> {
  $$CardBankRelTableTableTableManager(
      _$AppDatabase db, $CardBankRelTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardBankRelTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardBankRelTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardBankRelTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> cardId = const Value.absent(),
            Value<int> bankId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardBankRelTableCompanion(
            cardId: cardId,
            bankId: bankId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int cardId,
            required int bankId,
            Value<int> rowid = const Value.absent(),
          }) =>
              CardBankRelTableCompanion.insert(
            cardId: cardId,
            bankId: bankId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CardBankRelTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false, bankId = false}) {
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
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$CardBankRelTableTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$CardBankRelTableTableReferences._cardIdTable(db).id,
                  ) as T;
                }
                if (bankId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.bankId,
                    referencedTable:
                        $$CardBankRelTableTableReferences._bankIdTable(db),
                    referencedColumn:
                        $$CardBankRelTableTableReferences._bankIdTable(db).id,
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

typedef $$CardBankRelTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardBankRelTableTable,
    CardBankRelTableData,
    $$CardBankRelTableTableFilterComposer,
    $$CardBankRelTableTableOrderingComposer,
    $$CardBankRelTableTableAnnotationComposer,
    $$CardBankRelTableTableCreateCompanionBuilder,
    $$CardBankRelTableTableUpdateCompanionBuilder,
    (CardBankRelTableData, $$CardBankRelTableTableReferences),
    CardBankRelTableData,
    PrefetchHooks Function({bool cardId, bool bankId})>;
typedef $$LogoTableTableCreateCompanionBuilder = LogoTableCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> path,
  required String url,
  required LogoCategoryEnum category,
});
typedef $$LogoTableTableUpdateCompanionBuilder = LogoTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> path,
  Value<String> url,
  Value<LogoCategoryEnum> category,
});

final class $$LogoTableTableReferences
    extends BaseReferences<_$AppDatabase, $LogoTableTable, LogoTableData> {
  $$LogoTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IssuerLogoRelTable, List<IssuerLogoRelData>>
      _issuerLogoRelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.issuerLogoRel,
              aliasName: $_aliasNameGenerator(
                  db.logoTable.id, db.issuerLogoRel.logoId));

  $$IssuerLogoRelTableProcessedTableManager get issuerLogoRelRefs {
    final manager = $$IssuerLogoRelTableTableManager($_db, $_db.issuerLogoRel)
        .filter((f) => f.logoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issuerLogoRelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BankLogoRelTable, List<BankLogoRelData>>
      _bankLogoRelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.bankLogoRel,
              aliasName:
                  $_aliasNameGenerator(db.logoTable.id, db.bankLogoRel.logoId));

  $$BankLogoRelTableProcessedTableManager get bankLogoRelRefs {
    final manager = $$BankLogoRelTableTableManager($_db, $_db.bankLogoRel)
        .filter((f) => f.logoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bankLogoRelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LogoTableTableFilterComposer
    extends Composer<_$AppDatabase, $LogoTableTable> {
  $$LogoTableTableFilterComposer({
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

  ColumnFilters<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LogoCategoryEnum, LogoCategoryEnum, int>
      get category => $composableBuilder(
          column: $table.category,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> issuerLogoRelRefs(
      Expression<bool> Function($$IssuerLogoRelTableFilterComposer f) f) {
    final $$IssuerLogoRelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.issuerLogoRel,
        getReferencedColumn: (t) => t.logoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerLogoRelTableFilterComposer(
              $db: $db,
              $table: $db.issuerLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> bankLogoRelRefs(
      Expression<bool> Function($$BankLogoRelTableFilterComposer f) f) {
    final $$BankLogoRelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.bankLogoRel,
        getReferencedColumn: (t) => t.logoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankLogoRelTableFilterComposer(
              $db: $db,
              $table: $db.bankLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LogoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LogoTableTable> {
  $$LogoTableTableOrderingComposer({
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

  ColumnOrderings<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$LogoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogoTableTable> {
  $$LogoTableTableAnnotationComposer({
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

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogoCategoryEnum, int> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> issuerLogoRelRefs<T extends Object>(
      Expression<T> Function($$IssuerLogoRelTableAnnotationComposer a) f) {
    final $$IssuerLogoRelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.issuerLogoRel,
        getReferencedColumn: (t) => t.logoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerLogoRelTableAnnotationComposer(
              $db: $db,
              $table: $db.issuerLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> bankLogoRelRefs<T extends Object>(
      Expression<T> Function($$BankLogoRelTableAnnotationComposer a) f) {
    final $$BankLogoRelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.bankLogoRel,
        getReferencedColumn: (t) => t.logoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankLogoRelTableAnnotationComposer(
              $db: $db,
              $table: $db.bankLogoRel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LogoTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LogoTableTable,
    LogoTableData,
    $$LogoTableTableFilterComposer,
    $$LogoTableTableOrderingComposer,
    $$LogoTableTableAnnotationComposer,
    $$LogoTableTableCreateCompanionBuilder,
    $$LogoTableTableUpdateCompanionBuilder,
    (LogoTableData, $$LogoTableTableReferences),
    LogoTableData,
    PrefetchHooks Function({bool issuerLogoRelRefs, bool bankLogoRelRefs})> {
  $$LogoTableTableTableManager(_$AppDatabase db, $LogoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> path = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<LogoCategoryEnum> category = const Value.absent(),
          }) =>
              LogoTableCompanion(
            id: id,
            name: name,
            path: path,
            url: url,
            category: category,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> path = const Value.absent(),
            required String url,
            required LogoCategoryEnum category,
          }) =>
              LogoTableCompanion.insert(
            id: id,
            name: name,
            path: path,
            url: url,
            category: category,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LogoTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {issuerLogoRelRefs = false, bankLogoRelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (issuerLogoRelRefs) db.issuerLogoRel,
                if (bankLogoRelRefs) db.bankLogoRel
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (issuerLogoRelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$LogoTableTableReferences
                            ._issuerLogoRelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LogoTableTableReferences(db, table, p0)
                                .issuerLogoRelRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.logoId == item.id),
                        typedResults: items),
                  if (bankLogoRelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$LogoTableTableReferences
                            ._bankLogoRelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LogoTableTableReferences(db, table, p0)
                                .bankLogoRelRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.logoId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LogoTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LogoTableTable,
    LogoTableData,
    $$LogoTableTableFilterComposer,
    $$LogoTableTableOrderingComposer,
    $$LogoTableTableAnnotationComposer,
    $$LogoTableTableCreateCompanionBuilder,
    $$LogoTableTableUpdateCompanionBuilder,
    (LogoTableData, $$LogoTableTableReferences),
    LogoTableData,
    PrefetchHooks Function({bool issuerLogoRelRefs, bool bankLogoRelRefs})>;
typedef $$IssuerLogoRelTableCreateCompanionBuilder = IssuerLogoRelCompanion
    Function({
  required int issuerId,
  required int logoId,
  Value<int> rowid,
});
typedef $$IssuerLogoRelTableUpdateCompanionBuilder = IssuerLogoRelCompanion
    Function({
  Value<int> issuerId,
  Value<int> logoId,
  Value<int> rowid,
});

final class $$IssuerLogoRelTableReferences extends BaseReferences<_$AppDatabase,
    $IssuerLogoRelTable, IssuerLogoRelData> {
  $$IssuerLogoRelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $IssuerTableTable _issuerIdTable(_$AppDatabase db) =>
      db.issuerTable.createAlias(
          $_aliasNameGenerator(db.issuerLogoRel.issuerId, db.issuerTable.id));

  $$IssuerTableTableProcessedTableManager get issuerId {
    final $_column = $_itemColumn<int>('issuer_id')!;

    final manager = $$IssuerTableTableTableManager($_db, $_db.issuerTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_issuerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LogoTableTable _logoIdTable(_$AppDatabase db) =>
      db.logoTable.createAlias(
          $_aliasNameGenerator(db.issuerLogoRel.logoId, db.logoTable.id));

  $$LogoTableTableProcessedTableManager get logoId {
    final $_column = $_itemColumn<int>('logo_id')!;

    final manager = $$LogoTableTableTableManager($_db, $_db.logoTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_logoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$IssuerLogoRelTableFilterComposer
    extends Composer<_$AppDatabase, $IssuerLogoRelTable> {
  $$IssuerLogoRelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$IssuerTableTableFilterComposer get issuerId {
    final $$IssuerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.issuerId,
        referencedTable: $db.issuerTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerTableTableFilterComposer(
              $db: $db,
              $table: $db.issuerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LogoTableTableFilterComposer get logoId {
    final $$LogoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.logoId,
        referencedTable: $db.logoTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LogoTableTableFilterComposer(
              $db: $db,
              $table: $db.logoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IssuerLogoRelTableOrderingComposer
    extends Composer<_$AppDatabase, $IssuerLogoRelTable> {
  $$IssuerLogoRelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$IssuerTableTableOrderingComposer get issuerId {
    final $$IssuerTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.issuerId,
        referencedTable: $db.issuerTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerTableTableOrderingComposer(
              $db: $db,
              $table: $db.issuerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LogoTableTableOrderingComposer get logoId {
    final $$LogoTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.logoId,
        referencedTable: $db.logoTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LogoTableTableOrderingComposer(
              $db: $db,
              $table: $db.logoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IssuerLogoRelTableAnnotationComposer
    extends Composer<_$AppDatabase, $IssuerLogoRelTable> {
  $$IssuerLogoRelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$IssuerTableTableAnnotationComposer get issuerId {
    final $$IssuerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.issuerId,
        referencedTable: $db.issuerTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IssuerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.issuerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LogoTableTableAnnotationComposer get logoId {
    final $$LogoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.logoId,
        referencedTable: $db.logoTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LogoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.logoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IssuerLogoRelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IssuerLogoRelTable,
    IssuerLogoRelData,
    $$IssuerLogoRelTableFilterComposer,
    $$IssuerLogoRelTableOrderingComposer,
    $$IssuerLogoRelTableAnnotationComposer,
    $$IssuerLogoRelTableCreateCompanionBuilder,
    $$IssuerLogoRelTableUpdateCompanionBuilder,
    (IssuerLogoRelData, $$IssuerLogoRelTableReferences),
    IssuerLogoRelData,
    PrefetchHooks Function({bool issuerId, bool logoId})> {
  $$IssuerLogoRelTableTableManager(_$AppDatabase db, $IssuerLogoRelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IssuerLogoRelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IssuerLogoRelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IssuerLogoRelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> issuerId = const Value.absent(),
            Value<int> logoId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IssuerLogoRelCompanion(
            issuerId: issuerId,
            logoId: logoId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int issuerId,
            required int logoId,
            Value<int> rowid = const Value.absent(),
          }) =>
              IssuerLogoRelCompanion.insert(
            issuerId: issuerId,
            logoId: logoId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IssuerLogoRelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({issuerId = false, logoId = false}) {
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
                      dynamic,
                      dynamic>>(state) {
                if (issuerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.issuerId,
                    referencedTable:
                        $$IssuerLogoRelTableReferences._issuerIdTable(db),
                    referencedColumn:
                        $$IssuerLogoRelTableReferences._issuerIdTable(db).id,
                  ) as T;
                }
                if (logoId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.logoId,
                    referencedTable:
                        $$IssuerLogoRelTableReferences._logoIdTable(db),
                    referencedColumn:
                        $$IssuerLogoRelTableReferences._logoIdTable(db).id,
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

typedef $$IssuerLogoRelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IssuerLogoRelTable,
    IssuerLogoRelData,
    $$IssuerLogoRelTableFilterComposer,
    $$IssuerLogoRelTableOrderingComposer,
    $$IssuerLogoRelTableAnnotationComposer,
    $$IssuerLogoRelTableCreateCompanionBuilder,
    $$IssuerLogoRelTableUpdateCompanionBuilder,
    (IssuerLogoRelData, $$IssuerLogoRelTableReferences),
    IssuerLogoRelData,
    PrefetchHooks Function({bool issuerId, bool logoId})>;
typedef $$BankLogoRelTableCreateCompanionBuilder = BankLogoRelCompanion
    Function({
  required int bankId,
  required int logoId,
  Value<int> rowid,
});
typedef $$BankLogoRelTableUpdateCompanionBuilder = BankLogoRelCompanion
    Function({
  Value<int> bankId,
  Value<int> logoId,
  Value<int> rowid,
});

final class $$BankLogoRelTableReferences
    extends BaseReferences<_$AppDatabase, $BankLogoRelTable, BankLogoRelData> {
  $$BankLogoRelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BankTableTable _bankIdTable(_$AppDatabase db) =>
      db.bankTable.createAlias(
          $_aliasNameGenerator(db.bankLogoRel.bankId, db.bankTable.id));

  $$BankTableTableProcessedTableManager get bankId {
    final $_column = $_itemColumn<int>('bank_id')!;

    final manager = $$BankTableTableTableManager($_db, $_db.bankTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bankIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LogoTableTable _logoIdTable(_$AppDatabase db) =>
      db.logoTable.createAlias(
          $_aliasNameGenerator(db.bankLogoRel.logoId, db.logoTable.id));

  $$LogoTableTableProcessedTableManager get logoId {
    final $_column = $_itemColumn<int>('logo_id')!;

    final manager = $$LogoTableTableTableManager($_db, $_db.logoTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_logoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BankLogoRelTableFilterComposer
    extends Composer<_$AppDatabase, $BankLogoRelTable> {
  $$BankLogoRelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$BankTableTableFilterComposer get bankId {
    final $$BankTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankTableTableFilterComposer(
              $db: $db,
              $table: $db.bankTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LogoTableTableFilterComposer get logoId {
    final $$LogoTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.logoId,
        referencedTable: $db.logoTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LogoTableTableFilterComposer(
              $db: $db,
              $table: $db.logoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BankLogoRelTableOrderingComposer
    extends Composer<_$AppDatabase, $BankLogoRelTable> {
  $$BankLogoRelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$BankTableTableOrderingComposer get bankId {
    final $$BankTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankTableTableOrderingComposer(
              $db: $db,
              $table: $db.bankTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LogoTableTableOrderingComposer get logoId {
    final $$LogoTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.logoId,
        referencedTable: $db.logoTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LogoTableTableOrderingComposer(
              $db: $db,
              $table: $db.logoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BankLogoRelTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankLogoRelTable> {
  $$BankLogoRelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$BankTableTableAnnotationComposer get bankId {
    final $$BankTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bankId,
        referencedTable: $db.bankTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BankTableTableAnnotationComposer(
              $db: $db,
              $table: $db.bankTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LogoTableTableAnnotationComposer get logoId {
    final $$LogoTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.logoId,
        referencedTable: $db.logoTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LogoTableTableAnnotationComposer(
              $db: $db,
              $table: $db.logoTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BankLogoRelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankLogoRelTable,
    BankLogoRelData,
    $$BankLogoRelTableFilterComposer,
    $$BankLogoRelTableOrderingComposer,
    $$BankLogoRelTableAnnotationComposer,
    $$BankLogoRelTableCreateCompanionBuilder,
    $$BankLogoRelTableUpdateCompanionBuilder,
    (BankLogoRelData, $$BankLogoRelTableReferences),
    BankLogoRelData,
    PrefetchHooks Function({bool bankId, bool logoId})> {
  $$BankLogoRelTableTableManager(_$AppDatabase db, $BankLogoRelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankLogoRelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankLogoRelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankLogoRelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> bankId = const Value.absent(),
            Value<int> logoId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BankLogoRelCompanion(
            bankId: bankId,
            logoId: logoId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int bankId,
            required int logoId,
            Value<int> rowid = const Value.absent(),
          }) =>
              BankLogoRelCompanion.insert(
            bankId: bankId,
            logoId: logoId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BankLogoRelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bankId = false, logoId = false}) {
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
                      dynamic,
                      dynamic>>(state) {
                if (bankId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.bankId,
                    referencedTable:
                        $$BankLogoRelTableReferences._bankIdTable(db),
                    referencedColumn:
                        $$BankLogoRelTableReferences._bankIdTable(db).id,
                  ) as T;
                }
                if (logoId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.logoId,
                    referencedTable:
                        $$BankLogoRelTableReferences._logoIdTable(db),
                    referencedColumn:
                        $$BankLogoRelTableReferences._logoIdTable(db).id,
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

typedef $$BankLogoRelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BankLogoRelTable,
    BankLogoRelData,
    $$BankLogoRelTableFilterComposer,
    $$BankLogoRelTableOrderingComposer,
    $$BankLogoRelTableAnnotationComposer,
    $$BankLogoRelTableCreateCompanionBuilder,
    $$BankLogoRelTableUpdateCompanionBuilder,
    (BankLogoRelData, $$BankLogoRelTableReferences),
    BankLogoRelData,
    PrefetchHooks Function({bool bankId, bool logoId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountTableTableTableManager get accountTable =>
      $$AccountTableTableTableManager(_db, _db.accountTable);
  $$CardTableTableTableManager get cardTable =>
      $$CardTableTableTableManager(_db, _db.cardTable);
  $$AccountCardRelTableTableTableManager get accountCardRelTable =>
      $$AccountCardRelTableTableTableManager(_db, _db.accountCardRelTable);
  $$CreditLoanTableTableTableManager get creditLoanTable =>
      $$CreditLoanTableTableTableManager(_db, _db.creditLoanTable);
  $$CardCreditRelTableTableTableManager get cardCreditRelTable =>
      $$CardCreditRelTableTableTableManager(_db, _db.cardCreditRelTable);
  $$IssuerTableTableTableManager get issuerTable =>
      $$IssuerTableTableTableManager(_db, _db.issuerTable);
  $$CardIssuerRelTableTableTableManager get cardIssuerRelTable =>
      $$CardIssuerRelTableTableTableManager(_db, _db.cardIssuerRelTable);
  $$BankTableTableTableManager get bankTable =>
      $$BankTableTableTableManager(_db, _db.bankTable);
  $$CardBankRelTableTableTableManager get cardBankRelTable =>
      $$CardBankRelTableTableTableManager(_db, _db.cardBankRelTable);
  $$LogoTableTableTableManager get logoTable =>
      $$LogoTableTableTableManager(_db, _db.logoTable);
  $$IssuerLogoRelTableTableManager get issuerLogoRel =>
      $$IssuerLogoRelTableTableManager(_db, _db.issuerLogoRel);
  $$BankLogoRelTableTableManager get bankLogoRel =>
      $$BankLogoRelTableTableManager(_db, _db.bankLogoRel);
}
