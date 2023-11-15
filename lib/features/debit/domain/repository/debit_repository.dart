import 'package:paisa/core/enum/debt_type.dart';
import 'package:paisa/features/debit/domain/entities/debit_entity.dart';

abstract class DebitRepository {
  Future<void> add(
    String description,
    String name,
    double amount,
    DateTime currentDateTime,
    DateTime dueDateTime,
    DebitType debtType,
  );

  Future<void> update({
    required String description,
    required String name,
    required double amount,
    required DateTime currentDateTime,
    required DateTime dueDateTime,
    required DebitType debtType,
    required int key,
  });

  DebitEntity? fetchFromId(int debtId);

  Future<void> deleteById(int debtId);
}
