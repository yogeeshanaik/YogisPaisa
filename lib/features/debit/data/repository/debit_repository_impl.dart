import 'package:injectable/injectable.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/debt_type.dart';
import 'package:paisa/features/debit/data/data_sources/debit_data_manager.dart';
import 'package:paisa/features/debit/data/models/debit_model.dart';
import 'package:paisa/features/debit/domain/entities/debit_entity.dart';
import 'package:paisa/features/debit/domain/repository/debit_repository.dart';

@Singleton(as: DebitRepository)
class DebtRepositoryImpl extends DebitRepository {
  DebtRepositoryImpl(
    this.localDataManager,
  );

  final DebitDataManager localDataManager;

  @override
  Future<void> add(
    String description,
    String name,
    double amount,
    DateTime currentDateTime,
    DateTime dueDateTime,
    DebitType debtType,
  ) {
    return localDataManager.addDebtOrCredit(
      DebitModel(
        description: description,
        amount: amount,
        dateTime: currentDateTime,
        expiryDateTime: dueDateTime,
        debtType: debtType,
        name: name,
      ),
    );
  }

  @override
  DebitEntity? fetchFromId(int debtId) =>
      localDataManager.fetchDebtOrCreditFromId(debtId)?.toEntity();

  @override
  Future<void> deleteById(int debtId) {
    return localDataManager.deleteDebtOrCreditFromId(debtId);
  }

  @override
  Future<void> update({
    required String description,
    required String name,
    required double amount,
    required DateTime currentDateTime,
    required DateTime dueDateTime,
    required DebitType debtType,
    required int key,
  }) {
    return localDataManager.update(DebitModel(
      description: description,
      name: name,
      amount: amount,
      dateTime: currentDateTime,
      expiryDateTime: dueDateTime,
      debtType: debtType,
      superId: key,
    ));
  }
}
