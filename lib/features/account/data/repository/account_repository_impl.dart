import 'package:injectable/injectable.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/account/data/data_sources/account_manager.dart';
import 'package:paisa/features/account/data/model/account_model.dart';
import 'package:paisa/features/account/domain/repository/account_repository.dart';

@Singleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  AccountRepositoryImpl({@Named('local-account') required this.dataSource});

  final AccountManager dataSource;

  @override
  Future<void> add({
    required String bankName,
    required String holderName,
    required String number,
    required CardType cardType,
    required double amount,
    required int color,
    required bool isAccountExcluded,
  }) {
    return dataSource.add(AccountModel(
      name: holderName,
      bankName: bankName,
      number: number,
      cardType: cardType,
      amount: amount,
      color: color,
      isAccountExcluded: isAccountExcluded,
    ));
  }

  @override
  List<AccountModel> all() {
    return dataSource.accounts();
  }

  @override
  Future<void> clearAll() {
    return dataSource.clear();
  }

  @override
  Future<void> delete(int key) {
    return dataSource.delete(key);
  }

  @override
  AccountModel? fetchById(int? accountId) {
    return dataSource.findById(accountId);
  }

  @override
  Future<void> update({
    required int key,
    required String? bankName,
    required String? holderName,
    required String? number,
    required CardType? cardType,
    required double? amount,
    required int? color,
    required bool isAccountExcluded,
  }) {
    return dataSource.update(
      AccountModel(
        name: holderName,
        bankName: bankName,
        number: number,
        cardType: cardType,
        amount: amount,
        superId: key,
        color: color,
        isAccountExcluded: isAccountExcluded,
      ),
    );
  }
}
