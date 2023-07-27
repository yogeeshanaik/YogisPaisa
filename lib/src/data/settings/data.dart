// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/main.dart';
import 'package:paisa/src/core/common.dart';
import 'package:paisa/src/core/enum/box_types.dart';
import 'package:paisa/src/core/enum/card_type.dart';
import 'package:paisa/src/core/enum/tran_source.dart';
import 'package:paisa/src/core/enum/transaction.dart';
import 'package:paisa/src/data/accounts/model/account_model.dart';
import 'package:paisa/src/data/category/model/category_model.dart';
import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';
import 'package:paisa/src/data/expense/model/expense_model.dart';

class Data {
  Data({
    required this.expenses,
    required this.accounts,
    required this.categories,
  });

  late List<ExpenseModel> expenses;
  late List<AccountModel> accounts;
  late List<CategoryModel> categories;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        expenses: List<ExpenseModel>.from(
            json["expenses"].map((x) => ExpenseModel.fromJson(x))),
        accounts: List<AccountModel>.from(
            json["accounts"].map((x) => AccountModel.fromJson(x))),
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "expenses": List<dynamic>.from(expenses.map((x) => x.toJson())),
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };

  Data.fromCSV(String csvContent) {
    final currentSource = TranSource.values[getIt
        .get<Box<dynamic>>(instanceName: BoxType.settings.name)
        .get(tranSourceKey, defaultValue: 0)];

    final expenseBox = Hive.box<ExpenseModel>(BoxType.expense.name);
    int expenseIdCounter = -1;
    if (expenseBox.values.isNotEmpty) {
      expenseIdCounter =
          expenseBox.values.map<int>((e) => e.superId!).reduce(max);
    }
    categories = getIt.get<Box<CategoryModel>>().values.toList();
    List<CategoryModel> initialCategories = List.from(categories);

    accounts = getIt.get<Box<AccountModel>>().values.toList();
    List<AccountModel> initialAccounts = List.from(accounts);

    switch (currentSource) {
      case TranSource.rbc:
        expenses = fromRbc(csvContent, expenseIdCounter, currentSource);
        break;
      case TranSource.cibc:
        expenses = fromCIBC(csvContent, expenseIdCounter, currentSource);
        break;
      case TranSource.coins:
        expenses = fromCoins(csvContent, expenseIdCounter, currentSource);
        break;
    }
    categories = categories
        .where((element) => !initialCategories.contains(element))
        .toList();
    accounts = accounts
        .where((element) => !initialAccounts.contains(element))
        .toList();
  }

  int getCategoryId(String text) {
    int categoryId = 0; //Default

    // add default category if no categories exists
    if (categories.isEmpty) {
      Map<String, dynamic> jsonData = {
        "categories": [
          {
            "name": "Default",
            "description": "All expenses",
            "icon": 983772,
            "superId": 0,
            "budget": 0.0,
            "color": 4278238420
          }
        ]
      };
      categories = List<CategoryModel>.from(
          jsonData["categories"].map((x) => CategoryModel.fromJson(x)));
    }

    var tag = getIt
        .get<Box<CategoryTagModel>>()
        .values
        .where((tag) => text.toLowerCase().contains(tag.name.toLowerCase()))
        .firstOrNull;

    var category = getIt
        .get<Box<CategoryModel>>()
        .values
        .where((element) => element.superId == (tag?.categoryId ?? -1))
        .firstOrNull;

    categoryId = category?.superId ?? 0;

    return categoryId;
  }

  List<ExpenseModel> fromRbc(
      String csvContent, int expenseIdCounter, TranSource tranSource) {
    List<String> lines = csvContent.split('\n');

//remove last empty line
    if (lines.last.isEmpty) {
      lines.removeLast();
    }

//remove header
//Header: [0]:"Account Type"[1]:"Account Number"[2]:"Transaction Date"[3]:"Cheque Number"[4]:"Description 1"[5]:"Description 2"[6]:"CAD$"[7]:"USD$"
    lines.removeAt(0);

    List<ExpenseModel> expenses = lines.map((e) {
      var columns = e.split(',').map((c) => c.replaceAll('"', '')).toList();

      int accountId =
          getAccountId(columns.isNotEmpty ? columns[1] : '', tranSource.name);

      return ExpenseModel(
        name: columns[4],
        currency:
            double.parse(columns[6].replaceAll(',', '').replaceAll('-', '')),
        time: DateFormat('MM/dd/y').parse(columns[2]),
        categoryId: getCategoryId('${columns[4]} - ${columns[5]}'),
        accountId: accountId ?? 0,
        type: columns[6].contains('-')
            ? TransactionType.expense
            : TransactionType.income,
        description: columns[5],
      )..superId = expenseIdCounter += 1;
    }).toList();
    return expenses;
  }

  List<ExpenseModel> fromCIBC(
      String csvContent, int expenseIdCounter, TranSource tranSource) {
    List<String> lines = csvContent.split('\n');

    //remove last empty line
    if (lines.last.isEmpty) {
      lines.removeLast();
    }

    //remove header
    //Header:
    //[0]:"Transaction Date"
    //[1]:"Name"
    //[2]:"Currency" // Debit
    //[3]:"Currenct" // Credit
    //[4]:"Description" // Account number

    lines.removeAt(0);

    //Delimiter char in name replaced with '-'
    lines = lines.map((e) => e.replaceAll(', ', '- ')).toList();

    List<ExpenseModel> expenses = lines.map((e) {
      var columns = e.split(',').map((c) => c.replaceAll('"', '')).toList();

      int accountId =
          getAccountId(columns.length > 4 ? columns[4] : '', tranSource.name);

      double debit = columns[2].isNotEmpty ? double.parse(columns[2]) : 0;
      double credit = columns[3].isNotEmpty ? double.parse(columns[3]) : 0;

      String description = columns.length > 4 ? columns[4] : '';

      return ExpenseModel(
        name: columns[1],
        currency: debit > 0 ? debit : credit,
        time: DateFormat('y-MM-dd').parse(columns[0]),
        categoryId: getCategoryId(columns[1]),
        accountId: accountId,
        type: debit > 0 ? TransactionType.expense : TransactionType.income,
        description: description,
      )..superId = expenseIdCounter += 1;
    }).toList();
    return expenses;
  }

  List<ExpenseModel> fromCoins(
      String csvContent, int expenseIdCounter, TranSource tranSource) {
    var expenses = csvContent.split('\n').map((e) {
      var columns = e.split('","').map((c) => c.replaceAll('"', '')).toList();
      return ExpenseModel(
        name: '${columns[1]} - ${columns[3]}',
        currency: double.parse(columns[2]
            .replaceAll(',', '')
            .replaceAll('-', '')
            .replaceAll('+', '')),
        time: DateTime.parse(columns[0]),
        categoryId: getCategoryId(columns[1].toString()),
        accountId: getAccountId('', tranSource.name),
        type: columns[2].contains('-')
            ? TransactionType.expense
            : TransactionType.income,
        description: '${columns[1]} - ${columns[3]}',
      )..superId = expenseIdCounter += 1;
    }).toList();
    return expenses;
  }

  int getAccountId(String accountNumber, String bankName) {
    int accountId = 0;

// add default account if no accounts exists
    if (accounts.isEmpty) {
      Map<String, dynamic> jsonData = {
        "accounts": [
          {
            "name": "Default",
            "bankName": "Default",
            "icon": 983318,
            "number": "0000",
            "cardType": "Bank",
            "superId": 0,
            "amount": 0.0
          }
        ]
      };
      accounts = List<AccountModel>.from(
          jsonData["accounts"].map((x) => AccountModel.fromJson(x)));
    }

// Add account if doesn't exists
    var last4digit = (accountNumber.isNotEmpty)
        ? accountNumber.substring(accountNumber.length - 4)
        : '';
    var acctDetails =
        accounts.firstWhereOrNull((element) => last4digit == element.number);

    if (acctDetails == null) {
      if (last4digit.isNotEmpty) {
        accountId = accounts.map<int>((e) => e.superId!).reduce(max);
        accountId += 1;

        var acct = AccountModel(
          name: accountNumber,
          icon: MdiIcons.creditCard.codePoint,
          bankName: bankName,
          number: last4digit,
          cardType: CardType.bank,
          amount: 0.0,
        )..superId = accountId;

        accounts.add(acct);
      }
    } else {
      accountId = acctDetails.superId!;
    }
    return accountId;
  }

  Data.fromList(
      List<List<dynamic>> list, List<String> mappedColumns, int? accountId) {
    final expenseBox = Hive.box<ExpenseModel>(BoxType.expense.name);
    int expenseIdCounter = -1;
    if (expenseBox.values.isNotEmpty) {
      expenseIdCounter =
          expenseBox.values.map<int>((e) => e.superId!).reduce(max);
    }
    categories = getIt.get<Box<CategoryModel>>().values.toList();
    List<CategoryModel> initialCategories = List.from(categories);

    accounts = getIt.get<Box<AccountModel>>().values.toList();
    List<AccountModel> initialAccounts = List.from(accounts);

//Prepare expense to load
    expenses = [];

    for (var row in list) {
      if (row.length < mappedColumns.length) {
        continue;
      }
      expenses.add(parseExpense(row, mappedColumns, accountId)
        ..superId = expenseIdCounter += 1);
    }

    categories = categories
        .where((element) => !initialCategories.contains(element))
        .toList();
    accounts = accounts
        .where((element) => !initialAccounts.contains(element))
        .toList();
  }

  ExpenseModel parseExpense(
      List<dynamic> row, List<String> mappedColumns, int? accountId) {
    TransactionType type = TransactionType.expense;

    dynamic name = '';
    if (mappedColumns.contains("Expense Name")) {
      name = row[mappedColumns.indexOf("Expense Name")];
    }

    dynamic description = '';
    if (mappedColumns.contains("Description")) {
      description = row[mappedColumns.indexOf("Description")];
    }

    dynamic currency = 0.0;
    if (mappedColumns.contains("Amount")) {
      currency = row[mappedColumns.indexOf("Amount")];
      currency = double.tryParse(
              currency.toString().replaceAll('\$', '').replaceAll(',', '')) ??
          0.0;

      if (currency < 0) {
        type = TransactionType.expense;
      } else {
        type = TransactionType.income;
      }
    }

    dynamic currencyCredit = 0.0;
    if (mappedColumns.contains("Amount - Credit")) {
      currencyCredit = row[mappedColumns.indexOf("Amount - Credit")];
      currencyCredit = double.tryParse(
              currencyCredit.toString().replaceAll(RegExp("[^0-9.]"), '')) ??
          0.0;
    }

    dynamic currencyDebit = 0.0;
    if (mappedColumns.contains("Amount - Debit")) {
      currencyDebit = row[mappedColumns.indexOf("Amount - Debit")];
      currencyDebit = double.tryParse(
              currencyDebit.toString().replaceAll(RegExp("[^0-9.]"), '')) ??
          0.0;
    }

    if (currency == 0) {
      currency = currencyCredit;
      type = TransactionType.income;
    }
    if (currency == 0) {
      currency = currencyDebit;
      type = TransactionType.expense;
    }

    dynamic dateTime;
    if (mappedColumns.contains("Date Time")) {
      var value = row[mappedColumns.indexOf("Date Time")];
      dateTime ??= DateTime.tryParse(value.toString());
      dateTime ??= parseUnknownFormateDate(value);
    }

    dynamic date;
    if (mappedColumns.contains("Date")) {
      date = row[mappedColumns.indexOf("Date")];
      dateTime ??= DateTime.tryParse(date.toString());
      dateTime ??= parseUnknownFormateDate(date);
    }

    dynamic time;
    if (mappedColumns.contains("Time")) {
      time = row[mappedColumns.indexOf("Time")];
      dateTime ??= DateTime.tryParse(time.toString());
    }

    dynamic accountNumber = '';
    if (mappedColumns.contains("Account Number")) {
      accountNumber = row[mappedColumns.indexOf("Account Number")];
    }

    dynamic accountType = '';
    if (mappedColumns.contains("Account Type")) {
      accountType = row[mappedColumns.indexOf("Account Type")];
    }

    String bankName = 'Unknown';
    if (accountType.toString().isNotEmpty) {
      bankName = accountType;
    }

    int categoryId = getCategoryId('$name - $description');
    accountId ??= getAccountId(accountNumber.toString(), bankName);

    return ExpenseModel(
      name: name.toString(),
      currency: currency < 0
          ? (currency *= -1)
          : currency, // converted negative value to positive
      time: dateTime,
      categoryId: categoryId,
      accountId: accountId,
      type: type,
      description: description.toString(),
    );
  }

  DateTime parseUnknownFormateDate(String date) {
    if (date.isEmpty) {
      return DateTime.utc(-271821, 04, 20); // min date
    }

    dynamic dateTime = DateTime.tryParse(date);
    try {
      dateTime ??= DateFormat("MM/dd/y").parse(date); //Date: 21/11/2023
    } catch (e) {
      dateTime ??= DateFormat("MMM dd, y").parse(date); //Date: Jun 30, 2023
    }

    return dateTime;
  }
}
