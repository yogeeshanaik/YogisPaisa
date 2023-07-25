import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../core/enum/card_type.dart';
import '../../../domain/account/entities/account.dart';
import '../../../domain/expense/entities/expense.dart';
import '../../widgets/lava/lava_clock.dart';
import '../../widgets/paisa_bottom_sheet.dart';
import '../bloc/accounts_bloc.dart';
import 'account_card.dart';

class AccountPageViewWidget extends StatefulWidget {
  const AccountPageViewWidget({
    Key? key,
    required this.accounts,
    required this.accountBloc,
  }) : super(key: key);

  final List<Account> accounts;
  final AccountsBloc accountBloc;

  @override
  State<AccountPageViewWidget> createState() => _AccountPageViewWidgetState();
}

class _AccountPageViewWidgetState extends State<AccountPageViewWidget> {
  final PageController _controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: PageView.builder(
              padEnds: true,
              pageSnapping: true,
              key: const Key('accounts_page_view'),
              controller: _controller,
              itemCount: widget.accounts.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
                widget.accountBloc
                    .add(AccountSelectedEvent(widget.accounts[index]));
              },
              itemBuilder: (_, index) {
                final Account account = widget.accounts[index];
                final List<Expense> expenses = widget.accountBloc
                    .fetchExpenseFromAccountId(account.superId!);
                final String expense = expenses.totalExpense.toCurrency();
                final String income = expenses.totalIncome.toCurrency();
                final String totalBalance =
                    (expenses.fullTotal + account.initialAmount).toCurrency();
                return AccountCard(
                  key: ValueKey(account.hashCode),
                  accountId: account.superId!,
                  expense: expense,
                  income: income,
                  totalBalance: totalBalance,
                  cardHolder: account.name,
                  cardNumber: account.number,
                  bankName: '${account.superId} - ${account.bankName}',
                  cardType: account.cardType ?? CardType.bank,
                  onDelete: () => paisaAlertDialog(
                    context,
                    title: Text(context.loc.dialogDeleteTitleLabel),
                    child: RichText(
                      text: TextSpan(
                        text: context.loc.deleteAccountLabel,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: account.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    confirmationButton: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onPressed: () {
                        widget.accountBloc
                            .add(DeleteAccountEvent(account.superId!));
                        Navigator.pop(context);
                      },
                      child: Text(context.loc.deleteLabel),
                    ),
                  ),
                  onTap: () => context.pushNamed(
                    editAccountPath,
                    params: <String, String>{'aid': account.superId.toString()},
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildPageIndicator(),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.accounts.length,
          (index) => GestureDetector(
            onTap: () => _controller.jumpToPage(index),
            child: _indicator(
              index == selectedIndex,
            ),
          ),
        ),
      );

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8,
      width: isActive ? 24 : 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).disabledColor,
      ),
    );
  }
}
