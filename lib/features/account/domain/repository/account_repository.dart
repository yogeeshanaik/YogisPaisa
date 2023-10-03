import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/account/data/model/account_model.dart';

abstract class AccountRepository {
  Future<void> add({
    required String bankName,
    required String holderName,
    required String number,
    required CardType cardType,
    required double amount,
    required int color,
    required bool isAccountExcluded,
  });

  Future<void> update({
    required int key,
    required String? bankName,
    required String? holderName,
    required String? number,
    required CardType? cardType,
    required double? amount,
    required int? color,
    required bool isAccountExcluded,
  });

  Future<void> delete(int key);

  AccountModel? fetchById(int? accountId);

  List<AccountModel> all();

  Future<void> clearAll();
}
