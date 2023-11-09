import 'package:flutter/material.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_history_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_total_widget.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/welcome_name_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction.dart';

class SummaryTabletWidget extends StatelessWidget {
  const SummaryTabletWidget({
    super.key,
    required this.expenses,
    required this.accountEntity,
  });

  final List<TransactionEntity> expenses;
  final AccountEntity accountEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const WelcomeNameWidget(),
                  ExpenseTotalWidget(
                    expenses: expenses,
                    accountEntity: accountEntity,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 124),
                children: [ExpenseHistoryWidget(expenses: expenses)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
