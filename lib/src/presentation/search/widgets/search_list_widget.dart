import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paisa/src/core/enum/transaction.dart';
import 'package:paisa/src/presentation/overview/cubit/budget_cubit.dart';
import 'package:paisa/src/presentation/settings/bloc/settings_controller.dart';
import 'package:paisa/src/presentation/summary/controller/summary_controller.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../data/expense/model/expense_model.dart';
import '../../../domain/expense/entities/expense.dart';
import '../../expense/bloc/expense_bloc.dart';
import '../../summary/widgets/expense_list_widget.dart';

class SearchListWidget extends StatelessWidget {
  SearchListWidget({Key? key, required this.query, required this.callback})
      : super(key: key);

  final String query;
  final Function callback;

  final ExpenseBloc expenseBloc = getIt.get<ExpenseBloc>()
    ..add(const ChangeExpenseEvent(TransactionType.expense));

  final BudgetCubit budgetCubit = getIt.get();
  final SummaryController summaryController = getIt.get();
  final SettingsController settingsController = getIt.get();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ExpenseModel>>(
      valueListenable: getIt.get<Box<ExpenseModel>>().listenable(),
      builder: (context, value, child) {
        List<Expense> expenses = value.search(query);

        return ValueListenableBuilder<String>(
            valueListenable: summaryController.selectedTimeNotifier,
            builder: (context, value, child) {
              if (expenses.isNotEmpty) {
                budgetCubit.fetchBudgetSummary(
                    expenses, settingsController.fetchFilterExpense);
              }
              return BlocBuilder(
                bloc: budgetCubit,
                buildWhen: (previous, current) =>
                    current is FilteredCategoryListState,
                builder: (context, state) {
                  //filter date range
                  expenses = budgetCubit
                          .timeExpenses[settingsController.selectedTime] ??
                      [];

                  expenses = expenses.filterTransactionTypes(
                      settingsController.filterTranTypeList!);
                  expenses = expenses
                      .filterAccounts(settingsController.filterAccountIdList!);
                  expenses = expenses.filterCategories(
                      settingsController.filterCategoryIdList!);

                  if (expenses.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.sentiment_satisfied_rounded,
                              size: 72,
                            ),
                            Text(context.loc.emptySearchMessageLabel),
                          ],
                        ),
                      ),
                    );
                  } else {
                    callback(expenses);
                    return Expanded(
                      child: SingleChildScrollView(
                        child: ExpenseListWidget(expenses: expenses),
                      ),
                    );
                  }
                },
              );
            });
      },
    );
  }
}
