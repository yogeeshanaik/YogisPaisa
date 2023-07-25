import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/domain/expense/entities/expense.dart';
import 'package:paisa/src/presentation/search/widgets/date_range_picker_widget.dart';
import 'package:paisa/src/presentation/search/widgets/more_menu_widget.dart';
import 'package:paisa/src/presentation/search/widgets/select_date_range_widget.dart';
import 'package:paisa/src/presentation/settings/bloc/settings_controller.dart';
import 'package:paisa/src/presentation/search/widgets/filter_expense_widget.dart';
import 'package:paisa/src/presentation/widgets/filter_widget/filter_budget_widget.dart';

import '../../../data/expense/model/expense_model.dart';
import '../widgets/search_list_widget.dart';

class SearchPage extends SearchDelegate<ExpenseModel?> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      // AppBarTheme copies from the context making use of the overall theme.
      appBarTheme: Theme.of(context).appBarTheme,
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  late List<Expense> _expenses = [];
  callback(List<Expense> expenses) {
    _expenses = expenses;
  }

  int get filtersCount {
    final SettingsController settingsController = getIt.get();
    int count = 0;
    if (settingsController.filterTranTypeList!.isNotEmpty) {
      count++;
    }
    if (settingsController.filterAccountIdList!.isNotEmpty) {
      count++;
    }
    if (settingsController.filterCategoryIdList!.isNotEmpty) {
      count++;
    }
    return count;
  }

  var resultsWidget = (String query, Function callback) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FilterBudgetToggleWidget(),
            const SelectDateRangeWidget(),
            SearchListWidget(query: query.toLowerCase(), callback: callback),
          ],
        ),
        floatingActionButton: const DateRangePickerWidget(),
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width >= 700
                  ? 700
                  : double.infinity,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            builder: (context) {
              return const FilterExpenseWidget();
            },
          );
        },
        icon: //const Icon(MdiIcons.filter),
            Badge(
          backgroundColor: Theme.of(context).primaryColor,
          label: Text(filtersCount.toString()),
          child: const Icon(MdiIcons.filter),
        ),
      ),
      SearchMoreMenuWidget(expenses: _expenses),
      const SizedBox.shrink()
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return resultsWidget(query, callback);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return resultsWidget(query, callback);
  }
}
