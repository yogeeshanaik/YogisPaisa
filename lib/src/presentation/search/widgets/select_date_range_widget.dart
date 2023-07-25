import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/core/common.dart';
import 'package:paisa/src/core/enum/filter_budget.dart';
import 'package:paisa/src/data/expense/model/expense_model.dart';
import 'package:paisa/src/presentation/overview/cubit/budget_cubit.dart';
import 'package:paisa/src/presentation/overview/widgets/filter_date_range_widget.dart';
import 'package:paisa/src/presentation/settings/bloc/settings_controller.dart';
import 'package:paisa/src/presentation/summary/controller/summary_controller.dart';
import 'package:paisa/src/presentation/widgets/paisa_chip.dart';
import 'package:paisa/src/presentation/widgets/paisa_empty_widget.dart';

class SelectDateRangeWidget extends StatefulWidget {
  const SelectDateRangeWidget({super.key});

  @override
  State<SelectDateRangeWidget> createState() => _SelectDateRangeWidgetState();
}

class _SelectDateRangeWidgetState extends State<SelectDateRangeWidget> {
  @override
  Widget build(BuildContext context) {
    final BudgetCubit budgetCubit = getIt.get();
    final SummaryController summaryController = getIt.get();
    final SettingsController settingsController = getIt.get();

    return FilterDateRangeWidget(
      dateTimeRangeNotifier: summaryController.dateTimeRangeNotifier,
      expenses: getIt.get<Box<ExpenseModel>>().values.toEntities(),
      builder: (expenses) {
        if (expenses.isEmpty) {
          return EmptyWidget(
            icon: Icons.paid,
            title: "No expenses",
            description: context.loc.emptyOverviewDescriptionLabel,
          );
        }
        return ValueListenableBuilder<FilterExpense>(
          valueListenable: summaryController.filterExpenseNotifier,
          builder: (context, value, child) {
            budgetCubit.fetchBudgetSummary(expenses, value);
            // Added by yogeesha
            getIt
                .get<SettingsController>()
                .setSelectedTime(budgetCubit.selectedTime!);

            return SizedBox(
              //height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder(
                    bloc: budgetCubit,
                    buildWhen: (previous, current) =>
                        current is InitialSelectedState,
                    builder: (context, state) {
                      if (state is InitialSelectedState) {
                        return SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.filerTimes.length,
                            itemBuilder: (context, index) {
                              final item = state.filerTimes[index];
                              return PaisaMaterialYouChip(
                                title: item,
                                onPressed: () {
                                  if (budgetCubit.selectedTime != item) {
                                    budgetCubit.updateFilterTime(item);
                                    settingsController.setSelectedTime(item);
                                  }
                                },
                                isSelected: item == budgetCubit.selectedTime,
                              );
                            },
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
