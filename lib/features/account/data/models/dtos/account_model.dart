import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../../core/constants/classes/mock_data.dart';
import '../../../business/entities/account_entity.dart';
import '../../data_sources/local/tables/account_table.dart';

/// Model that transforms the Account data from the API to the application
/// entity
class AccountModel extends AccountEntity {
  /// Model that transforms the Account data from the API to the application
  /// entity
  const AccountModel({
    required super.id,
    required super.name,
    required super.color,
    required super.type,
    required super.currency,
  });

  /// Factory method to create an AccountModel from a drift map
  factory AccountModel.fromDriftMap(AccountTableData data) => AccountModel(
        id: data.id,
        name: data.name,
        color: colorFromHex(data.color),
        type: data.typeId,
        currency: data.currency,
      );
}
