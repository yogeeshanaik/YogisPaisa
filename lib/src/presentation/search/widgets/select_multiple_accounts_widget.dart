import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paisa/src/app/routes.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';
import 'package:paisa/src/presentation/expense/widgets/selectable_item_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../data/accounts/model/account_model.dart';
import '../../../data/settings/settings.dart';
import '../../../domain/account/entities/account.dart';

class SelectedAccounts extends StatefulWidget {
  const SelectedAccounts({super.key});

  @override
  State<SelectedAccounts> createState() => _SelectedAccountsState();
}

class _SelectedAccountsState extends State<SelectedAccounts> {
  final Settings settings = getIt.get<Settings>();

  int filteredAccountsCount = 0;
  void refreshSelectedAccountsCount() {
    setState(() {
      filteredAccountsCount = settings.filterAccountIdList!.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    late final expenseBloc = BlocProvider.of<ExpenseBloc>(context);
    refreshSelectedAccountsCount();

    return ValueListenableBuilder<Box<AccountModel>>(
      valueListenable: getIt.get<Box<AccountModel>>().listenable(),
      builder: (context, value, child) {
        final accounts = value.values.toEntities();
        if (accounts.isEmpty) {
          return ListTile(
            subtitle: Text(
              context.loc.noAccountAvailableLabel,
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          );
        }

        return ScreenTypeLayout(
          tablet: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Badge(
                  label: Text(filteredAccountsCount.toString()),
                  child: Text(
                    context.loc.selectAccountLabel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              AccountSelectedItem(
                accounts: accounts,
                expenseBloc: expenseBloc,
              )
            ],
          ),
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Badge(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(filteredAccountsCount.toString()),
                  child: Text(
                    '${context.loc.selectAccountLabel}    ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              AccountSelectedItem(
                accounts: accounts,
                expenseBloc: expenseBloc,
              )
            ],
          ),
        );
      },
    );
  }
}

class AccountSelectedItem extends StatefulWidget {
  const AccountSelectedItem({
    Key? key,
    required this.accounts,
    required this.expenseBloc,
  }) : super(key: key);

  final List<Account> accounts;
  final ExpenseBloc expenseBloc;

  @override
  State<AccountSelectedItem> createState() => _AccountSelectedItemState();
}

class _AccountSelectedItemState extends State<AccountSelectedItem> {
  @override
  Widget build(BuildContext context) {
    final Settings settings = getIt.get<Settings>();
    return BlocBuilder(
      bloc: widget.expenseBloc,
      buildWhen: (previous, current) => current is ChangeAccountState,
      builder: (context, state) {
        return SizedBox(
          height: 180,
          child: ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.accounts.length,
            itemBuilder: (_, index) {
              final Account account = widget.accounts[index];
              bool isSelected =
                  settings.filterAccountIdList!.contains(account.superId);
              return ItemWidget(
                isSelected: isSelected,
                title: account.name,
                icon: account.icon,
                onPressed: () {
                  setState(() {
                    var accountIdList = settings.filterAccountIdList;
                    bool isFiltered = accountIdList!.contains(account.superId);

                    if (isFiltered) {
                      accountIdList.remove(account.superId!);
                    } else {
                      accountIdList.add(account.superId!);
                    }
                    settings.setFilterAccountIdList(accountIdList);
                    final _SelectedAccountsState? state = context
                        .findAncestorStateOfType<_SelectedAccountsState>();
                    state?.refreshSelectedAccountsCount();
                  });
                },
                subtitle: account.bankName,
              );
            },
          ),
        );
      },
    );
  }
}
