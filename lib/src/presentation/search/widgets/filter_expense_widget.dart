import 'package:flutter/material.dart';
import '../../summary/controller/summary_controller.dart';

import '../../../../main.dart';
import '../../../core/enum/filter_budget.dart';
import '../../settings/bloc/settings_controller.dart';
import 'expense_options_widget.dart';

class FilterExpenseWidget extends StatelessWidget {
  const FilterExpenseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SummaryController summaryController = getIt.get();
    return ValueListenableBuilder<FilterExpense>(
      valueListenable: summaryController.filterExpenseNotifier,
      builder: (_, value, child) {
        getIt.get<SettingsController>().setFilterExpense(value);

        return
            // SafeArea(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       ListTile(
            //         title: Text(
            //           'Filter list',
            //           style: Theme.of(context).textTheme.titleLarge,
            //         ),
            //       ),
            SizedBox(
          width: 600.0,
          height: MediaQuery.of(context).size.height * 0.60,
          child: const ExpenseOptionsWidget(),
        );
        //     ],
        //   ),
        // );
      },
    );
  }
}
