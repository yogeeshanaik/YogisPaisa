import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/filter_budget.dart';

const selectedFilterExpenseKey = "selected_filter_expense_key";
const selectedTimeKey = "selected_time_key";
const defaultAccountIdKey = "default_account_id_key";
const defaultCategoryIdKey = "default_category_id_key";

// Filters
const filterTranTypeListKey = "filter_tran_type_list_key";
const filterAccountIdListKey = "filter_account_id_list_key";
const filterCategoryIdListKey = "filter_category_id_list_key";

// Switches
const clearExpensesEnabledKey = "clear_expesnes_enabled_key";
const clearAccountsEnabledKey = "clear_accounts_enabled_key";
const clearCategoriesEnabledKey = "clear_categories_enabled_key";
const clearCategoryTagsEnabledKey = "clear_category_tags_enabled_key";

@singleton
class Settings {
  final Box<dynamic> settings;

  Settings(@Named('settings') this.settings);

  FilterExpense get fetchFilterExpense {
    return settings.get(selectedFilterExpenseKey,
        defaultValue: FilterExpense.daily);
  }

  Future<void> setFilterExpense(FilterExpense expense) async =>
      settings.put(selectedFilterExpenseKey, expense);

  String get selectedTime => settings.get(selectedTimeKey) ?? "";

  Future<void> setSelectedTime(String selectedTime) async =>
      settings.put(selectedTimeKey, selectedTime);

  int? get defaultAccountId => settings.get(defaultAccountIdKey);

  Future<void> setDefaultAccountId(int accountId) async =>
      settings.put(defaultAccountIdKey, accountId);

  int? get defaultCategoryId => settings.get(defaultCategoryIdKey);

  Future<void> setDefaultCategoryId(int categoryId) async =>
      settings.put(defaultCategoryIdKey, categoryId);

  //Filters
  List<String>? get filterTranTypeList =>
      settings.get(filterTranTypeListKey) ?? [];

  Future<void> setFilterTranTypeList(List<String> tranTypeList) async =>
      settings.put(filterTranTypeListKey, tranTypeList);

  List<int>? get filterAccountIdList =>
      settings.get(filterAccountIdListKey) ?? [];

  Future<void> setFilterAccountIdList(List<int> accountIdList) async =>
      settings.put(filterAccountIdListKey, accountIdList);

  List<int>? get filterCategoryIdList =>
      settings.get(filterCategoryIdListKey) ?? [];

  Future<void> setFilterCategoryIdList(List<int> categoryIdList) async =>
      settings.put(filterCategoryIdListKey, categoryIdList);

  // Switches
  bool? get clearExpensesEnabled => settings.get(clearExpensesEnabledKey);

  Future<void> setClearExpensesEnabled(bool enabled) async =>
      settings.put(clearExpensesEnabledKey, enabled);

  bool? get clearAccountsEnabled => settings.get(clearAccountsEnabledKey);

  Future<void> setClearAccountsEnabled(bool enabled) async =>
      settings.put(clearAccountsEnabledKey, enabled);

  bool? get clearCategoriesEnabled => settings.get(clearCategoriesEnabledKey);

  Future<void> setClearCategoriesEnabled(bool enabled) async =>
      settings.put(clearCategoriesEnabledKey, enabled);

  bool? get clearCategoryTagsEnabled =>
      settings.get(clearCategoryTagsEnabledKey);

  Future<void> setClearCategoryTagsEnabled(bool enabled) async =>
      settings.put(clearCategoryTagsEnabledKey, enabled);

//       const clearAccountsEnabledKey = "clear_accounts_enabled_key";
// const clearCategoriesEnabledKey = "clear_categories_enabled_key";
// const clearCategoryTagsEnabledKey = "clear_category_tags_enabled_key";
}
