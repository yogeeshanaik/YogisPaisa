import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:paisa/main.dart';
import 'package:paisa/src/core/common.dart';

import 'package:paisa/src/core/enum/transaction.dart';

import 'package:paisa/src/data/settings/settings.dart';
import 'package:paisa/src/domain/account/entities/account.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';
import 'package:paisa/src/presentation/expense/widgets/select_account_widget.dart';
import 'package:paisa/src/presentation/expense/widgets/select_category_widget.dart';
import 'package:paisa/src/presentation/expense/widgets/selectable_item_widget.dart';
import 'package:paisa/src/presentation/search/widgets/date_range_picker_widget.dart';

import 'package:paisa/src/presentation/search/widgets/select_multiple_accounts_widget.dart';
import 'package:paisa/src/presentation/search/widgets/select_multiple_categories_widget.dart';
import 'package:paisa/src/presentation/search/widgets/transaction_type_filter_widget.dart';

import 'package:paisa/src/presentation/widgets/paisa_big_button_widget.dart';

import 'package:responsive_builder/responsive_builder.dart';

class ExpenseOptionsWidget extends StatelessWidget {
  const ExpenseOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ExpenseBloc expenseBloc = getIt.get<ExpenseBloc>()
      ..add(const ChangeExpenseEvent(TransactionType.expense));
    final Settings settings = getIt.get<Settings>();

    return BlocProvider(
      create: (context) => expenseBloc,
      child: BlocConsumer(
        bloc: expenseBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenTypeLayout(
            mobile: Scaffold(
              appBar: context.materialYouAppBar(
                "Filters",
                actions: [
                  TextButton(
                    child: const Text("Clear All"),
                    onPressed: () {
                      settings.setFilterTranTypeList([]);
                      settings.setFilterAccountIdList([]);
                      settings.setFilterCategoryIdList([]);
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // icon: Icon(
                  //   Icons.check,
                  //   color: Theme.of(context).colorScheme.primary,
                  // ),
                  // )
                ],
              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  TransactionTypeFilter(expenseBloc: expenseBloc),
                  const SizedBox(height: 16),
                  BlocBuilder(
                    bloc: expenseBloc,
                    buildWhen: (previous, current) =>
                        current is ChangeTransactionTypeState,
                    builder: (context, state) {
                      if (state is ChangeTransactionTypeState &&
                          (state.transactionType == TransactionType.expense ||
                              state.transactionType ==
                                  TransactionType.income)) {
                        return const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 16),
                            SelectedAccounts(),
                            SelectCategories(),
                          ],
                        );
                      } else {
                        return BlocBuilder(
                          bloc: expenseBloc,
                          buildWhen: (previous, current) =>
                              current is TransferAccountsState,
                          builder: (context, state) {
                            if (state is TransferAccountsState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'From Account',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(
                                        bottom: 16,
                                        left: 16,
                                        right: 16,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: state.accounts.length,
                                      itemBuilder: (_, index) {
                                        final Account account =
                                            state.accounts[index];
                                        return ItemWidget(
                                          isSelected: account.superId ==
                                              state.fromAccount.superId,
                                          title: account.name,
                                          icon: account.icon,
                                          onPressed: () {
                                            expenseBloc.add(
                                              TransferAccountsEvent(
                                                state.accounts,
                                                account,
                                                state.toAccount,
                                              ),
                                            );
                                          },
                                          subtitle: account.bankName,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'To Account',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(
                                        bottom: 16,
                                        left: 16,
                                        right: 16,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: state.accounts.length,
                                      itemBuilder: (_, index) {
                                        final Account account =
                                            state.accounts[index];
                                        return ItemWidget(
                                          isSelected: account.superId ==
                                              state.toAccount.superId,
                                          title: account.name,
                                          icon: account.icon,
                                          onPressed: () {
                                            expenseBloc.add(
                                              TransferAccountsEvent(
                                                state.accounts,
                                                state.fromAccount,
                                                account,
                                              ),
                                            );
                                          },
                                          subtitle: account.bankName,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              floatingActionButton: const DateRangePickerWidget(),
            ),
            tablet: Scaffold(
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PaisaBigButton(
                    onPressed: () {
                      //expenseBloc.add(AddOrUpdateExpenseEvent(isAddExpense));
                    },
                    title: context.loc.updateLabel,
                  ),
                ),
              ),
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SelectedAccount(),
                          SelectCategoryIcon(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
