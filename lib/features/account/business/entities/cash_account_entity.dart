import 'enums/account_type_enum.dart';
import 'account_entity.dart';

/// Entity that contains the data of an account with physical money
class CashAccountEntity extends AccountEntity {
  /// Entity that contains the data of an account with physical money
  const CashAccountEntity({
    required super.id,
    required super.name,
    required super.currency,
    super.color,
    super.type = AccountTypeEnum.CASH,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        currency,
        color,
        type,
      ];

  @override
  bool get stringify => true;
}
