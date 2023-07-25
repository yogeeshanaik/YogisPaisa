import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/app/routes.dart';
import 'package:paisa/src/core/common.dart';
import 'package:paisa/src/core/enum/transaction.dart';
import 'package:paisa/src/domain/account/entities/account.dart';
import 'package:paisa/src/domain/expense/entities/expense.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';
import 'package:paisa/src/presentation/expense/widgets/select_account_widget.dart';
import 'package:paisa/src/presentation/expense/widgets/select_category_widget.dart';
import 'package:paisa/src/presentation/expense/widgets/selectable_item_widget.dart';
import 'package:paisa/src/presentation/expense/widgets/toggle_buttons_widget.dart';
import 'package:paisa/src/presentation/widgets/paisa_big_button_widget.dart';
import 'package:paisa/src/presentation/widgets/paisa_bottom_sheet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MultiExpenseUpdateWidget extends StatefulWidget {
  const MultiExpenseUpdateWidget({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  State<MultiExpenseUpdateWidget> createState() =>
      _MultiExpenseUpdateWidgetState();
}

class _MultiExpenseUpdateWidgetState extends State<MultiExpenseUpdateWidget> {
  bool updateTranType = false;
  bool updateAccount = false;
  bool updateCategory = false;
  @override
  Widget build(BuildContext context) {
    final ExpenseBloc expenseBloc = getIt.get<ExpenseBloc>()
      ..add(const ChangeExpenseEvent(TransactionType.expense));
    return BlocProvider(
      create: (context) => expenseBloc,
      child: BlocConsumer(
        bloc: expenseBloc,
        listener: (context, state) {
          if (state is ExpenseAdded) {
            final content =
                expenseBloc.transactionType == TransactionType.expense
                    ? state.isAddOrUpdate
                        ? context.loc.addedExpenseLabel
                        : context.loc.updatedExpenseLabel
                    : state.isAddOrUpdate
                        ? context.loc.incomeAddedSuccessfulLabel
                        : context.loc.incomeUpdateSuccessfulLabel;

            context.showMaterialSnackBar(
              content,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            );
            context.pop();
          } else if (state is ExpenseErrorState) {
            context.showMaterialSnackBar(
              state.errorString,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              color: Theme.of(context).colorScheme.onErrorContainer,
            );
          } else if (state is ExpenseSuccessState) {}
        },
        builder: (context, state) {
          return ScreenTypeLayout(
            mobile: Scaffold(
              appBar: context.materialYouAppBar(
                context.loc.updateExpenseLabel,
              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  TransactionToggleButtons(
                      expenseBloc: expenseBloc,
                      showUpdateTranTypeSwitch: updateTranType),
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            SelectedAccount(
                                showUpdateAccountSwitch: updateAccount),
                            SelectCategoryIcon(
                                showUpdateCategorySwitch: updateCategory),
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
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PaisaBigButton(
                    onPressed: () async {
                      var transactionType = expenseBloc.transactionType;
                      var selectedCategoryId = expenseBloc.selectedCategoryId;
                      var selectedAccountId = expenseBloc.selectedAccountId;
                      var fromAccount = expenseBloc.fromAccount;
                      var toAccount = expenseBloc.toAccount;

                      for (var e in widget.expenses) {
                        final Expense? expense =
                            await expenseBloc.expenseUseCase(e.superId!);

                        if (expense != null) {
                          expenseBloc
                            ..transactionType = expense.type!
                            ..selectedCategoryId = expense.categoryId
                            ..selectedAccountId = expense.accountId;
                          // ..fromAccount = expense.fromAccountId
                          // ..toAccount = expense.toAccountId

                          expenseBloc.expenseAmount = expense.currency;
                          expenseBloc.expenseName = expense.name;

                          expenseBloc.selectedDate = expense.time;
                          expenseBloc.timeOfDay =
                              TimeOfDay.fromDateTime(expense.time);
                          expenseBloc.currentDescription = expense.description;
                          expenseBloc.currentExpense = expense;
                        }
                        if (settings.get(enableAccountTypeSelectionKey,
                                defaultValue: false) ==
                            true) {
                          expenseBloc.transactionType = transactionType;
                        }

                        if (settings.get(enableCategorySelectionKey,
                                defaultValue: false) ==
                            true) {
                          expenseBloc.selectedCategoryId = selectedCategoryId;
                        }

                        if (settings.get(enableAccountSelectionKey,
                                defaultValue: false) ==
                            true) {
                          expenseBloc.selectedAccountId = selectedAccountId;
                        }
                        expenseBloc.fromAccount = fromAccount;
                        expenseBloc.toAccount = toAccount;

                        expenseBloc.add(const AddOrUpdateExpenseEvent(false));
                      }
                    },
                    title: context.loc.updateLabel,
                  ),
                ),
              ),
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
