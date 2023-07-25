import 'package:flutter/material.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/core/common.dart';
import 'package:paisa/src/domain/expense/entities/expense.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';
import 'package:paisa/src/presentation/search/widgets/multi_expense_update_widget.dart';
import 'package:paisa/src/presentation/widgets/paisa_bottom_sheet.dart';

enum Options { updateAll, deleteAll, copy, exit }

class SearchMoreMenuWidget extends StatefulWidget {
  const SearchMoreMenuWidget({Key? key, required this.expenses})
      : super(key: key);
  final List<Expense> expenses;

  @override
  State<SearchMoreMenuWidget> createState() => _SearchMoreMenuWidgetState();
}

class _SearchMoreMenuWidgetState extends State<SearchMoreMenuWidget> {
  var _popupMenuItemIndex = 0;
  Color _changeColorAccordingToMenuItem = Colors.red;
  var appBarHeight = AppBar().preferredSize.height;

  void updateAll(BuildContext context, List<Expense> expenses) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width >= 700 ? 700 : double.infinity,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return SizedBox(
              width: 600.0,
              height: MediaQuery.of(context).size.height * 0.78,
              child: MultiExpenseUpdateWidget(expenses: expenses));
        });
  }

  void deleteAll(BuildContext context, List<Expense> expenses) {
    paisaAlertDialog(
      context,
      title: Text(context.loc.dialogDeleteTitleLabel),
      child: RichText(
        text: TextSpan(
          text: context.loc.deleteExpenseLabel,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      confirmationButton: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: () {
          final ExpenseBloc expenseBloc = getIt.get<ExpenseBloc>();
          for (var e in expenses) {
            expenseBloc.add(ClearExpenseEvent(e.superId.toString()));
          }
          Navigator.pop(context);
        },
        child: Text(context.loc.deleteLabel),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Options.updateAll.index) {
      updateAll(context, widget.expenses);
    } else if (value == Options.deleteAll.index) {
      deleteAll(context, widget.expenses);
    } else if (value == Options.copy.index) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        _onMenuItemSelected(value as int);
      },
      offset: Offset(0.0, appBarHeight),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(8.0),
      //     bottomRight: Radius.circular(8.0),
      //     topLeft: Radius.circular(8.0),
      //     topRight: Radius.circular(8.0),
      //   ),
      // ),
      itemBuilder: (ctx) => [
        _buildPopupMenuItem('Update All', Icons.edit, Options.updateAll.index),
        _buildPopupMenuItem(
            'Delete All', Icons.delete, Options.deleteAll.index),
        // _buildPopupMenuItem('Copy', Icons.copy, Options.copy.index),
        // _buildPopupMenuItem('Exit', Icons.exit_to_app, Options.exit.index),
      ],
      child: const Icon(
        Icons.more_vert,
      ),
    );
  }
}
