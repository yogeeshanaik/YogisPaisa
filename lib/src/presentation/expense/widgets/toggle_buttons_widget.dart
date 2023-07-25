import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/data/settings/settings.dart';
import 'package:paisa/src/presentation/widgets/grayed_out.dart';

import '../../../core/common.dart';
import '../../../core/enum/transaction.dart';
import '../../widgets/paisa_chip.dart';
import '../bloc/expense_bloc.dart';

class TransactionToggleButtons extends StatelessWidget {
  const TransactionToggleButtons(
      {Key? key, required this.expenseBloc, this.showUpdateTranTypeSwitch})
      : super(key: key);

  final ExpenseBloc expenseBloc;
  final bool? showUpdateTranTypeSwitch;

  void _update(TransactionType type) {
    expenseBloc.add(ChangeExpenseEvent(type));
  }

  @override
  Widget build(BuildContext context) {
    final Settings settingsController = getIt.get<Settings>();
    bool disableWidget = showUpdateTranTypeSwitch == null
        ? false
        : !settingsController.settings
            .get(enableAccountTypeSelectionKey, defaultValue: false);

    return BlocBuilder(
      bloc: expenseBloc,
      buildWhen: (previous, current) => current is ChangeTransactionTypeState,
      builder: (context, state) {
        return Column(
          children: [
            showUpdateTranTypeSwitch == null
                ? const SizedBox()
                : SwitchListTile(
                    title: Text(
                      "Update transaction type?",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    value: settingsController.settings.get(
                        enableAccountTypeSelectionKey,
                        defaultValue: false),
                    onChanged: (newValue) {
                      settingsController.settings
                          .put(enableAccountTypeSelectionKey, newValue);
                    },
                  ),
            GrayedOut(
              grayedOut: disableWidget,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    PaisaMaterialYouChip(
                      title: TransactionType.expense.stringName(context),
                      isSelected: expenseBloc.transactionType ==
                          TransactionType.expense,
                      onPressed: () => _update(TransactionType.expense),
                    ),
                    PaisaMaterialYouChip(
                      title: TransactionType.income.stringName(context),
                      isSelected:
                          expenseBloc.transactionType == TransactionType.income,
                      onPressed: () => _update(TransactionType.income),
                    ),
                    PaisaMaterialYouChip(
                      title: TransactionType.transfer.stringName(context),
                      isSelected: expenseBloc.transactionType ==
                          TransactionType.transfer,
                      onPressed: () => _update(TransactionType.transfer),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
