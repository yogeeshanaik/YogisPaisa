import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/expense/model/expense_model.dart';
import '../../domain/expense/entities/expense.dart';
import '../common.dart';
import '../enum/filter_budget.dart';
import '../enum/transaction.dart';

extension ExpenseModelBoxMapping on Box<ExpenseModel> {
  List<Expense> search(query) => values
      .where((ExpenseModel element) =>
          element.name.toLowerCase().contains(query) ||
          element.description!.toLowerCase().contains(query) ||
          element.currency.toString().contains(query))
      .toEntities();

  List<ExpenseModel> get expenses =>
      values.toList()..sort(((a, b) => b.time.compareTo(a.time)));

  List<ExpenseModel> expensesFromAccountId(int accountId) =>
      expenses.where((element) => element.accountId == accountId).toList();

  List<ExpenseModel> get budgetOverView => values
      .where((element) => element.categoryId != -1 || element.accountId != -1)
      .where((element) => element.type == TransactionType.expense)
      .toList();

  List<ExpenseModel> isFilterTimeBetween(DateTimeRange range) =>
      values.where((element) => element.time.isAfterBeforeTime(range)).toList();

  Iterable<ExpenseModel> get expenseList =>
      values.where((element) => element.type == TransactionType.expense);

  Iterable<ExpenseModel> get incomeList =>
      values.where((element) => element.type == TransactionType.income);

  double get totalExpense => expenseList
      .map((e) => e.currency)
      .fold<double>(0, (previousValue, element) => previousValue + element);

  double get totalIncome => incomeList
      .map((e) => e.currency)
      .fold<double>(0, (previousValue, element) => previousValue + element);
}

extension ExpenseModelHelper on ExpenseModel {
  Expense toEntity() => Expense(
        name: name,
        currency: currency,
        time: time,
        categoryId: categoryId,
        accountId: accountId,
        type: type,
        description: description,
        fromAccountId: fromAccountId,
        superId: superId,
        toAccountId: toAccountId,
        transferAmount: transferAmount,
      );
}

extension ExpenseModelsHelper on Iterable<ExpenseModel> {
  List<Map<String, dynamic>> toJson() {
    return map((e) => e.toJson()).toList();
  }

  List<Expense> toEntities({bool sublist = false}) {
    final sortedList = map((expenseModel) => expenseModel.toEntity())
        .sorted((a, b) => b.time.compareTo(a.time));
    if (sublist && sortedList.length >= 100) {
      return sortedList.sublist(100);
    } else {
      return sortedList;
    }
  }
}

extension ExpensesHelper on Iterable<Expense> {
  List<Expense> get expenses =>
      toList()..sort(((a, b) => b.time.compareTo(a.time)));

  List<Expense> get expenseList =>
      where((element) => element.type == TransactionType.expense).toList();

  List<Expense> get incomeList =>
      where((element) => element.type == TransactionType.income).toList();

  String get balance => (totalIncome - totalExpense).toCurrency();

  List<Expense> isFilterTimeBetween(DateTimeRange range) =>
      where((element) => element.time.isAfterBeforeTime(range)).toList();

  double get filterTotal => fold<double>(0, (previousValue, element) {
        if (element.type == TransactionType.expense) {
          return previousValue - element.currency;
        } else if (element.type == TransactionType.income) {
          return previousValue + element.currency;
        } else {
          return previousValue;
        }
      });
  double get fullTotal => totalIncome - totalExpense;

  double get totalExpense => expenseList
      .map((e) => e.currency)
      .fold<double>(0, (previousValue, element) => previousValue + element);

  double get totalIncome => incomeList
      .map((e) => e.currency)
      .fold<double>(0, (previousValue, element) => previousValue + element);

  double get total => map((e) => e.currency)
      .fold<double>(0, (previousValue, element) => previousValue + element);

  double get thisMonthExpense =>
      where((element) => element.type == TransactionType.expense)
          .where((element) =>
              element.time.month == DateTime.now().month &&
              element.time.year == DateTime.now().year)
          .map((e) => e.currency)
          .fold<double>(0, (previousValue, element) => previousValue + element);

  List<Expense> get thisMonthExpensesList =>
      where((element) => element.type == TransactionType.expense)
          .where((element) =>
              element.time.month == DateTime.now().month &&
              element.time.year == DateTime.now().year)
          .toList();

  double get thisMonthIncome =>
      where((element) => element.type == TransactionType.income)
          .where((element) =>
              element.time.month == DateTime.now().month &&
              element.time.year == DateTime.now().year)
          .map((e) => e.currency)
          .fold<double>(0, (previousValue, element) => previousValue + element);

  List<MapEntry<String, List<Expense>>> groupByTime(
          FilterExpense filterBudget) =>
      groupBy(this,
              (ExpenseModel element) => element.time.formatted(filterBudget))
          .entries
          .toList();

  Map<String, List<Expense>> groupByTimeList(FilterExpense filterBudget) =>
      groupBy(
          this, (ExpenseModel element) => element.time.formatted(filterBudget));

  List<Expense> toEntities() =>
      map((expenseModel) => expenseModel.toEntity()).toList();
}

extension ExpenseListHelper on List<Expense> {
  List<Expense> filterTransactionTypes(List<String> tranTypeList) =>
      where((element) =>
              tranTypeList.isEmpty ||
              tranTypeList.any((field) =>
                  field.contains(element.type.toString().split('.').last)))
          .expenses;

  List<Expense> filterAccounts(List<int> accountIdList) => where((element) =>
      accountIdList.isEmpty ||
      accountIdList.any((field) => (field == element.accountId ||
          field == element.fromAccountId ||
          field == element.toAccountId))).expenses;

  List<Expense> filterCategories(List<int> categoryIdList) => where((element) =>
      categoryIdList.isEmpty ||
      categoryIdList.any((field) =>
          element.type.toString().split('.').last ==
              TransactionType.transfer.name ||
          field == element.categoryId)).expenses;
}

extension ExpenseHelper on Expense {}
