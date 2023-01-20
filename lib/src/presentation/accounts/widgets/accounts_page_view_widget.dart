import 'package:flutter/material.dart';
import '../../../lava/lava_clock.dart';
import '../../widgets/paisa_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/enum/card_type.dart';
import '../../../data/accounts/model/account.dart';
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
        LavaAnimation(
          child: AspectRatio(
            aspectRatio: 16 / 9,
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
                final account = widget.accounts[index];
                return AccountCard(
                  key: ValueKey(account.hashCode),
                  cardHolder: account.name,
                  cardNumber: account.number,
                  bankName: account.bankName,
                  cardType: account.cardType ?? CardType.bank,
                  onDelete: () => paisaAlertDialog(
                    context,
                    title: const Text('Permanently confirmation'),
                    child: Text(
                        'Deleting the account deletes all expenses which tied to this account ${account.name}'),
                    confirmationButton: ElevatedButton(
                      onPressed: () {
                        widget.accountBloc.add(DeleteAccountEvent(account));
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'),
                    ),
                  ),
                  onTap: () => GoRouter.of(context).goNamed(
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

  Widget _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.accounts.length; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return Row(
      children: list,
      mainAxisSize: MainAxisSize.min,
    );
  }

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