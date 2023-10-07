import 'package:paisa/features/account/data/model/account_model.dart';

abstract class AccountManager {
  Future<void> add(AccountModel account);

  Future<void> delete(int key);

  List<AccountModel> accounts();

  AccountModel? findById(int? accountId);

  Iterable<AccountModel> export();

  Future<void> update(AccountModel accountModel);

  Future<void> clear();
}
