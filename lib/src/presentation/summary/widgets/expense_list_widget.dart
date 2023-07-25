import 'package:flutter/material.dart';
import 'package:paisa/src/core/common.dart';

import '../../../../main.dart';
import '../../../core/enum/transaction.dart';
import '../../../domain/account/entities/account.dart';
import '../../../domain/category/entities/category.dart';
import '../../../domain/expense/entities/expense.dart';
import '../../widgets/paisa_card.dart';
import '../controller/summary_controller.dart';
import 'expense_item_widget.dart';
import 'expense_total_for_month_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final SummaryController summaryController = getIt.get();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PaisaCard(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ExpenseTotalForMonthWidget(
                outcome: expenses.totalExpense,
                income: expenses.totalIncome,
                tranCount: expenses.length),
          ),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expenses.length,
            itemBuilder: (_, index) {
              final Expense expense = expenses[index];
              if (expense.type == TransactionType.transfer) {
                final Account? fromAccount = summaryController
                    .getAccount(expenses[index].fromAccountId!);
                final Account? toAccount =
                    summaryController.getAccount(expenses[index].toAccountId!);

                if (fromAccount == null || toAccount == null) {
                  return const SizedBox.shrink();
                } else {
                  return ExpenseTransferItemWidget(
                    expense: expense,
                    fromAccount: fromAccount,
                    toAccount: toAccount,
                  );
                }
              } else {
                final Account? account =
                    summaryController.getAccount(expenses[index].accountId);
                final Category? category =
                    summaryController.getCategory(expenses[index].categoryId);
                if (account == null || category == null) {
                  return const SizedBox.shrink();
                } else {
                  return ExpenseItemWidget(
                    expense: expense,
                    account: account,
                    category: category,
                  );
                }
              }
            },
          ),
        ]),
      ),
    );
  }
}
