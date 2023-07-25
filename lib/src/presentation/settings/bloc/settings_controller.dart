import 'package:injectable/injectable.dart';

import '../../../core/enum/filter_budget.dart';
import '../../../data/settings/settings.dart';

@singleton
class SettingsController {
  final Settings settings;

  SettingsController(this.settings);

  FilterExpense get fetchFilterExpense => settings.fetchFilterExpense;

  Future<void> setFilterExpense(FilterExpense expense) async =>
      settings.setFilterExpense(expense);

  String get selectedTime => settings.selectedTime;

  Future<void> setSelectedTime(String selectedTime) async =>
      settings.setSelectedTime(selectedTime);

  int? get defaultAccountId => settings.defaultAccountId;

  Future<void> setDefaultAccountId(int accountId) async =>
      settings.setDefaultAccountId(accountId);

  int? get defaultCategoryId => settings.defaultCategoryId;

  Future<void> setDefaultCategoryId(int categoryId) async =>
      settings.setDefaultCategoryId(categoryId);

  //Filters

  List<String>? get filterTranTypeList => settings.filterTranTypeList;

  Future<void> setFilterTranTypeList(List<String> tranTypeList) async =>
      settings.setFilterTranTypeList(tranTypeList);

  List<int>? get filterAccountIdList => settings.filterAccountIdList;

  Future<void> setFilterAccountIdList(List<int> accountIdList) async =>
      settings.setFilterAccountIdList(accountIdList);

  List<int>? get filterCategoryIdList => settings.filterCategoryIdList;

  Future<void> setFilterCategoryIdList(List<int> categoryIdList) async =>
      settings.setFilterCategoryIdList(categoryIdList);
}
