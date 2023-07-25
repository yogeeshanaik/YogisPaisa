import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/data/settings/settings.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';

import '../../../core/common.dart';
import '../../../core/enum/transaction.dart';
import '../../widgets/paisa_chip.dart';

class TransactionTypeFilter extends StatefulWidget {
  const TransactionTypeFilter({
    Key? key,
    required this.expenseBloc,
  }) : super(key: key);

  final ExpenseBloc expenseBloc;

  @override
  State<TransactionTypeFilter> createState() => _TransactionTypeFilterState();
}

class _TransactionTypeFilterState extends State<TransactionTypeFilter> {
  @override
  Widget build(BuildContext context) {
    final Settings settings = getIt.get<Settings>();

    bool expenseSelected = false;
    bool incomeSelected = false;
    bool transferSelected = false;
    int filteredTranTypesCount = 0;
    void refreshSelectedTranTypesCount() {
      setState(() {
        expenseSelected = (settings.filterTranTypeList ?? [])
            .contains(TransactionType.expense.name);
        incomeSelected = (settings.filterTranTypeList ?? [])
            .contains(TransactionType.income.name);
        transferSelected = (settings.filterTranTypeList ?? [])
            .contains(TransactionType.transfer.name);
        filteredTranTypesCount = (settings.filterTranTypeList ?? []).length;
      });
    }

    void update(TransactionType type) {
      // setState(() {
      var tranTypeList = settings.filterTranTypeList;
      bool isFiltered = tranTypeList!.contains(type.name);

      if (isFiltered) {
        tranTypeList.remove(type.name);
      } else {
        tranTypeList.add(type.name);
      }
      settings.setFilterTranTypeList(tranTypeList);

      // });
      // widget.expenseBloc.add(ChangeExpenseEvent(type));
      refreshSelectedTranTypesCount();
    }

    refreshSelectedTranTypesCount();

    return BlocBuilder(
      bloc: widget.expenseBloc,
      buildWhen: (previous, current) => current is ChangeTransactionTypeState,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Badge(
                backgroundColor: Theme.of(context).primaryColor,
                label: Text(filteredTranTypesCount.toString()),
                child: Text(
                  'Transaction type    ',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  PaisaMaterialYouChip(
                    title: TransactionType.expense.stringName(context),
                    isSelected: expenseSelected,
                    onPressed: () => update(TransactionType.expense),
                  ),
                  PaisaMaterialYouChip(
                    title: TransactionType.income.stringName(context),
                    isSelected: incomeSelected,
                    onPressed: () => update(TransactionType.income),
                  ),
                  PaisaMaterialYouChip(
                    title: TransactionType.transfer.stringName(context),
                    isSelected: transferSelected,
                    onPressed: () => update(TransactionType.transfer),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
