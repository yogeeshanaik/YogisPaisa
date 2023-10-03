import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/enum/card_type.dart';
import 'package:paisa/core/error/bloc_errors.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/account/domain/use_case/account_use_case.dart';
import 'package:paisa/features/category/domain/use_case/get_category_use_case.dart';
import 'package:paisa/features/transaction/domain/entities/transaction.dart';
import 'package:paisa/features/transaction/domain/use_case/transaction_use_case.dart';

part 'accounts_bloc.freezed.dart';
part 'accounts_event.dart';
part 'accounts_state.dart';

@injectable
class AccountBloc extends Bloc<AccountsEvent, AccountState> {
  AccountBloc({
    required this.getAccountUseCase,
    required this.deleteAccountUseCase,
    required this.getTransactionsByAccountIdUseCase,
    required this.addAccountUseCase,
    required this.getCategoryUseCase,
    required this.deleteExpensesFromAccountIdUseCase,
    required this.updateAccountUseCase,
  }) : super(const AccountsInitial()) {
    on<AccountsEvent>((event, emit) {});
    on<AddOrUpdateAccountEvent>(_addAccount);
    on<DeleteAccountEvent>(_deleteAccount);
    on<UpdateCardTypeEvent>(_updateCardType);
    on<FetchAccountFromIdEvent>(_fetchAccountFromId);
    on<AccountColorSelectedEvent>(_updateAccountColor);
    on<FetchAccountAndExpenseFromIdEvent>(_fetchAccountAndExpensesFromId);
  }

  String? accountHolderName;
  String? accountName;
  String? accountNumber;
  final AddAccountUseCase addAccountUseCase;
  AccountEntity? currentAccount;
  final DeleteAccountUseCase deleteAccountUseCase;
  final DeleteTransactionsByAccountIdUseCase deleteExpensesFromAccountIdUseCase;
  final GetAccountUseCase getAccountUseCase;
  final GetCategoryUseCase getCategoryUseCase;
  final GetTransactionsByAccountIdUseCase getTransactionsByAccountIdUseCase;
  double? initialAmount;
  bool isAccountExcluded = false;
  int? selectedColor;
  CardType selectedType = CardType.cash;
  final UpdateAccountUseCase updateAccountUseCase;

  Future<void> _fetchAccountFromId(
    FetchAccountFromIdEvent event,
    Emitter<AccountState> emit,
  ) async {
    final AccountEntity? account =
        getAccountUseCase(GetAccountParams(event.accountId));
    if (account != null) {
      accountName = account.bankName;
      accountHolderName = account.name;
      accountNumber = account.number;
      selectedType = account.cardType ?? CardType.cash;
      initialAmount = account.amount;
      currentAccount = account;
      selectedColor = account.color ?? Colors.brown.shade100.value;
      isAccountExcluded = account.isAccountExcluded ?? false;
      emit(AccountSuccessState(account));
      emit(UpdateCardTypeState(selectedType));
      emit(UpdateAccountExcludeState(isAccountExcluded));
    } else {
      emit(const AccountErrorState(AccountErrors.accountNotFound()));
    }
  }

  Future<void> _addAccount(
    AddOrUpdateAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    final String? bankName = accountName;
    final String? holderName = accountHolderName;
    final String? number = accountNumber;
    final CardType cardType = selectedType;
    final double? amount = initialAmount;
    final int? color = selectedColor;
    if (bankName == null) {
      return emit(const AccountErrorState(AccountErrors.accountNotFound()));
    }
    if (holderName == null) {
      return emit(const AccountErrorState(AccountErrors.holderNameError()));
    }
    if (color == null) {
      return emit(const AccountErrorState(AccountErrors.colorError()));
    }

    if (event.addOrUpdate) {
      await addAccountUseCase(AddAccountParams(
        bankName: bankName,
        holderName: holderName,
        number: number ?? '',
        cardType: cardType,
        amount: amount ?? 0,
        color: color,
        isAccountExcluded: isAccountExcluded,
      ));
    } else {
      if (currentAccount == null) return;
      await updateAccountUseCase(UpdateAccountParams(
        currentAccount!.superId!,
        bankName: bankName,
        holderName: holderName,
        number: number ?? '',
        cardType: cardType,
        amount: amount ?? 0,
        color: color,
        isAccountExcluded: isAccountExcluded,
      ));
    }
    emit(AccountAddedState(event.addOrUpdate));
  }

  FutureOr<void> _deleteAccount(
    DeleteAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    await deleteExpensesFromAccountIdUseCase(
      DeleteTransactionsFromAccountIdParams(event.accountId),
    );
    await deleteAccountUseCase(DeleteAccountParams(event.accountId));
    emit(const AccountDeletedState());
  }

  FutureOr<void> _updateCardType(
    UpdateCardTypeEvent event,
    Emitter<AccountState> emit,
  ) async {
    selectedType = event.cardType;
    emit(UpdateCardTypeState(event.cardType));
  }

  FutureOr<void> _updateAccountColor(
    AccountColorSelectedEvent event,
    Emitter<AccountState> emit,
  ) {
    selectedColor = event.color;
    emit(AccountColorSelectedState(event.color));
  }

  FutureOr<void> _fetchAccountAndExpensesFromId(
    FetchAccountAndExpenseFromIdEvent event,
    Emitter<AccountState> emit,
  ) async {
    final AccountEntity? account =
        getAccountUseCase(GetAccountParams(event.accountId));
    final List<TransactionEntity> expenses = getTransactionsByAccountIdUseCase(
      GetTransactionsByAccountIdParams(event.accountId),
    );
    if (account != null) {
      emit(AccountAndExpensesState(account, expenses));
    }
  }
}
