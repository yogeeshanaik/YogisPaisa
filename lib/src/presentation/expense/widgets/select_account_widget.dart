import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/src/core/enum/box_types.dart';
import 'package:paisa/src/data/settings/settings.dart';
import 'package:paisa/src/presentation/widgets/grayed_out.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../data/accounts/model/account_model.dart';
import '../../../domain/account/entities/account.dart';
import '../bloc/expense_bloc.dart';
import 'selectable_item_widget.dart';

class SelectedAccount extends StatelessWidget {
  final bool? showUpdateAccountSwitch;
  const SelectedAccount({super.key, this.showUpdateAccountSwitch});

  @override
  Widget build(BuildContext context) {
    final Settings settingsController = getIt.get<Settings>();

    late final expenseBloc = BlocProvider.of<ExpenseBloc>(context);
    bool disableWidget = showUpdateAccountSwitch == null
        ? false
        : !settingsController.settings
            .get(enableAccountSelectionKey, defaultValue: false);
    Widget titleWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: showUpdateAccountSwitch == null
          ? Text(
              context.loc.selectAccountLabel,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          : SwitchListTile(
              title: Text(
                "Update account?",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              value: settingsController.settings
                  .get(enableAccountSelectionKey, defaultValue: false),
              onChanged: (newValue) {
                settingsController.settings
                    .put(enableAccountSelectionKey, newValue);
              },
            ),
    );

    return ValueListenableBuilder<Box<AccountModel>>(
      valueListenable: getIt.get<Box<AccountModel>>().listenable(),
      builder: (context, value, child) {
        final accounts = value.values.toEntities();
        if (accounts.isEmpty) {
          return ListTile(
            onTap: () => context.pushNamed(addAccountPath),
            title: Text(
              context.loc.addAccountLabel,
            ),
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
              titleWidget,
              GrayedOut(
                grayedOut: disableWidget,
                child: AccountSelectedItem(
                  accounts: accounts,
                  expenseBloc: expenseBloc,
                ),
              )
            ],
          ),
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget,
              GrayedOut(
                grayedOut: disableWidget,
                child: AccountSelectedItem(
                  accounts: accounts,
                  expenseBloc: expenseBloc,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class AccountSelectedItem extends StatelessWidget {
  const AccountSelectedItem({
    Key? key,
    required this.accounts,
    required this.expenseBloc,
  }) : super(key: key);

  final List<Account> accounts;
  final ExpenseBloc expenseBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: expenseBloc,
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
            itemCount: accounts.length + 1,
            itemBuilder: (_, index) {
              if (index == accounts.length) {
                return ItemWidget(
                  isSelected: false,
                  title: 'Add New',
                  icon: MdiIcons.plus.codePoint,
                  onPressed: () => context.pushNamed(addAccountPath),
                );
              } else {
                final Account account = accounts[index];
                return ItemWidget(
                  isSelected: account.superId == expenseBloc.selectedAccountId,
                  title: account.name,
                  icon: account.icon,
                  onPressed: () => expenseBloc.add(ChangeAccountEvent(account)),
                  subtitle: account.bankName,
                );
              }
            },
          ),
        );
      },
    );
  }
}
