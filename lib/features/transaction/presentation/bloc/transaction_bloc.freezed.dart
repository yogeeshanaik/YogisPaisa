// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
          TransactionEvent value, $Res Function(TransactionEvent) then) =
      _$TransactionEventCopyWithImpl<$Res, TransactionEvent>;
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res, $Val extends TransactionEvent>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AddOrUpdateExpenseEventCopyWith<$Res> {
  factory _$$_AddOrUpdateExpenseEventCopyWith(_$_AddOrUpdateExpenseEvent value,
          $Res Function(_$_AddOrUpdateExpenseEvent) then) =
      __$$_AddOrUpdateExpenseEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAdding});
}

/// @nodoc
class __$$_AddOrUpdateExpenseEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_AddOrUpdateExpenseEvent>
    implements _$$_AddOrUpdateExpenseEventCopyWith<$Res> {
  __$$_AddOrUpdateExpenseEventCopyWithImpl(_$_AddOrUpdateExpenseEvent _value,
      $Res Function(_$_AddOrUpdateExpenseEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdding = null,
  }) {
    return _then(_$_AddOrUpdateExpenseEvent(
      null == isAdding
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddOrUpdateExpenseEvent implements _AddOrUpdateExpenseEvent {
  const _$_AddOrUpdateExpenseEvent(this.isAdding);

  @override
  final bool isAdding;

  @override
  String toString() {
    return 'TransactionEvent.addOrUpdate(isAdding: $isAdding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOrUpdateExpenseEvent &&
            (identical(other.isAdding, isAdding) ||
                other.isAdding == isAdding));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAdding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOrUpdateExpenseEventCopyWith<_$_AddOrUpdateExpenseEvent>
      get copyWith =>
          __$$_AddOrUpdateExpenseEventCopyWithImpl<_$_AddOrUpdateExpenseEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return addOrUpdate(isAdding);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return addOrUpdate?.call(isAdding);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (addOrUpdate != null) {
      return addOrUpdate(isAdding);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return addOrUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return addOrUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (addOrUpdate != null) {
      return addOrUpdate(this);
    }
    return orElse();
  }
}

abstract class _AddOrUpdateExpenseEvent implements TransactionEvent {
  const factory _AddOrUpdateExpenseEvent(final bool isAdding) =
      _$_AddOrUpdateExpenseEvent;

  bool get isAdding;
  @JsonKey(ignore: true)
  _$$_AddOrUpdateExpenseEventCopyWith<_$_AddOrUpdateExpenseEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearExpenseEventCopyWith<$Res> {
  factory _$$_ClearExpenseEventCopyWith(_$_ClearExpenseEvent value,
          $Res Function(_$_ClearExpenseEvent) then) =
      __$$_ClearExpenseEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String expenseId});
}

/// @nodoc
class __$$_ClearExpenseEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_ClearExpenseEvent>
    implements _$$_ClearExpenseEventCopyWith<$Res> {
  __$$_ClearExpenseEventCopyWithImpl(
      _$_ClearExpenseEvent _value, $Res Function(_$_ClearExpenseEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseId = null,
  }) {
    return _then(_$_ClearExpenseEvent(
      null == expenseId
          ? _value.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ClearExpenseEvent implements _ClearExpenseEvent {
  const _$_ClearExpenseEvent(this.expenseId);

  @override
  final String expenseId;

  @override
  String toString() {
    return 'TransactionEvent.delete(expenseId: $expenseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClearExpenseEvent &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expenseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClearExpenseEventCopyWith<_$_ClearExpenseEvent> get copyWith =>
      __$$_ClearExpenseEventCopyWithImpl<_$_ClearExpenseEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return delete(expenseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return delete?.call(expenseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(expenseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _ClearExpenseEvent implements TransactionEvent {
  const factory _ClearExpenseEvent(final String expenseId) =
      _$_ClearExpenseEvent;

  String get expenseId;
  @JsonKey(ignore: true)
  _$$_ClearExpenseEventCopyWith<_$_ClearExpenseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeTransactionTypeEventCopyWith<$Res> {
  factory _$$_ChangeTransactionTypeEventCopyWith(
          _$_ChangeTransactionTypeEvent value,
          $Res Function(_$_ChangeTransactionTypeEvent) then) =
      __$$_ChangeTransactionTypeEventCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionType transactionType});
}

/// @nodoc
class __$$_ChangeTransactionTypeEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_ChangeTransactionTypeEvent>
    implements _$$_ChangeTransactionTypeEventCopyWith<$Res> {
  __$$_ChangeTransactionTypeEventCopyWithImpl(
      _$_ChangeTransactionTypeEvent _value,
      $Res Function(_$_ChangeTransactionTypeEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
  }) {
    return _then(_$_ChangeTransactionTypeEvent(
      null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ));
  }
}

/// @nodoc

class _$_ChangeTransactionTypeEvent implements _ChangeTransactionTypeEvent {
  const _$_ChangeTransactionTypeEvent(this.transactionType);

  @override
  final TransactionType transactionType;

  @override
  String toString() {
    return 'TransactionEvent.changeTransactionType(transactionType: $transactionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTransactionTypeEvent &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTransactionTypeEventCopyWith<_$_ChangeTransactionTypeEvent>
      get copyWith => __$$_ChangeTransactionTypeEventCopyWithImpl<
          _$_ChangeTransactionTypeEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return changeTransactionType(transactionType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return changeTransactionType?.call(transactionType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeTransactionType != null) {
      return changeTransactionType(transactionType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return changeTransactionType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return changeTransactionType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeTransactionType != null) {
      return changeTransactionType(this);
    }
    return orElse();
  }
}

abstract class _ChangeTransactionTypeEvent implements TransactionEvent {
  const factory _ChangeTransactionTypeEvent(
      final TransactionType transactionType) = _$_ChangeTransactionTypeEvent;

  TransactionType get transactionType;
  @JsonKey(ignore: true)
  _$$_ChangeTransactionTypeEventCopyWith<_$_ChangeTransactionTypeEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TransferAccountEventCopyWith<$Res> {
  factory _$$_TransferAccountEventCopyWith(_$_TransferAccountEvent value,
          $Res Function(_$_TransferAccountEvent) then) =
      __$$_TransferAccountEventCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account, bool isFromAccount});
}

/// @nodoc
class __$$_TransferAccountEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_TransferAccountEvent>
    implements _$$_TransferAccountEventCopyWith<$Res> {
  __$$_TransferAccountEventCopyWithImpl(_$_TransferAccountEvent _value,
      $Res Function(_$_TransferAccountEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? isFromAccount = null,
  }) {
    return _then(_$_TransferAccountEvent(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
      isFromAccount: null == isFromAccount
          ? _value.isFromAccount
          : isFromAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TransferAccountEvent implements _TransferAccountEvent {
  const _$_TransferAccountEvent(this.account, {this.isFromAccount = false});

  @override
  final AccountEntity account;
  @override
  @JsonKey()
  final bool isFromAccount;

  @override
  String toString() {
    return 'TransactionEvent.transferAccount(account: $account, isFromAccount: $isFromAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferAccountEvent &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.isFromAccount, isFromAccount) ||
                other.isFromAccount == isFromAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account, isFromAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransferAccountEventCopyWith<_$_TransferAccountEvent> get copyWith =>
      __$$_TransferAccountEventCopyWithImpl<_$_TransferAccountEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return transferAccount(account, isFromAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return transferAccount?.call(account, isFromAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transferAccount != null) {
      return transferAccount(account, isFromAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return transferAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return transferAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transferAccount != null) {
      return transferAccount(this);
    }
    return orElse();
  }
}

abstract class _TransferAccountEvent implements TransactionEvent {
  const factory _TransferAccountEvent(final AccountEntity account,
      {final bool isFromAccount}) = _$_TransferAccountEvent;

  AccountEntity get account;
  bool get isFromAccount;
  @JsonKey(ignore: true)
  _$$_TransferAccountEventCopyWith<_$_TransferAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddRecurringEventCopyWith<$Res> {
  factory _$$_AddRecurringEventCopyWith(_$_AddRecurringEvent value,
          $Res Function(_$_AddRecurringEvent) then) =
      __$$_AddRecurringEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddRecurringEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_AddRecurringEvent>
    implements _$$_AddRecurringEventCopyWith<$Res> {
  __$$_AddRecurringEventCopyWithImpl(
      _$_AddRecurringEvent _value, $Res Function(_$_AddRecurringEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddRecurringEvent implements _AddRecurringEvent {
  const _$_AddRecurringEvent();

  @override
  String toString() {
    return 'TransactionEvent.addRecurring()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddRecurringEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return addRecurring();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return addRecurring?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (addRecurring != null) {
      return addRecurring();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return addRecurring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return addRecurring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (addRecurring != null) {
      return addRecurring(this);
    }
    return orElse();
  }
}

abstract class _AddRecurringEvent implements TransactionEvent {
  const factory _AddRecurringEvent() = _$_AddRecurringEvent;
}

/// @nodoc
abstract class _$$_ChangeAccountEventCopyWith<$Res> {
  factory _$$_ChangeAccountEventCopyWith(_$_ChangeAccountEvent value,
          $Res Function(_$_ChangeAccountEvent) then) =
      __$$_ChangeAccountEventCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account});
}

/// @nodoc
class __$$_ChangeAccountEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_ChangeAccountEvent>
    implements _$$_ChangeAccountEventCopyWith<$Res> {
  __$$_ChangeAccountEventCopyWithImpl(
      _$_ChangeAccountEvent _value, $Res Function(_$_ChangeAccountEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_ChangeAccountEvent(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$_ChangeAccountEvent implements _ChangeAccountEvent {
  const _$_ChangeAccountEvent(this.account);

  @override
  final AccountEntity account;

  @override
  String toString() {
    return 'TransactionEvent.changeAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeAccountEvent &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeAccountEventCopyWith<_$_ChangeAccountEvent> get copyWith =>
      __$$_ChangeAccountEventCopyWithImpl<_$_ChangeAccountEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return changeAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return changeAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeAccount != null) {
      return changeAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return changeAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return changeAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeAccount != null) {
      return changeAccount(this);
    }
    return orElse();
  }
}

abstract class _ChangeAccountEvent implements TransactionEvent {
  const factory _ChangeAccountEvent(final AccountEntity account) =
      _$_ChangeAccountEvent;

  AccountEntity get account;
  @JsonKey(ignore: true)
  _$$_ChangeAccountEventCopyWith<_$_ChangeAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeCategoryEventCopyWith<$Res> {
  factory _$$_ChangeCategoryEventCopyWith(_$_ChangeCategoryEvent value,
          $Res Function(_$_ChangeCategoryEvent) then) =
      __$$_ChangeCategoryEventCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryEntity category});
}

/// @nodoc
class __$$_ChangeCategoryEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_ChangeCategoryEvent>
    implements _$$_ChangeCategoryEventCopyWith<$Res> {
  __$$_ChangeCategoryEventCopyWithImpl(_$_ChangeCategoryEvent _value,
      $Res Function(_$_ChangeCategoryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$_ChangeCategoryEvent(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ));
  }
}

/// @nodoc

class _$_ChangeCategoryEvent implements _ChangeCategoryEvent {
  const _$_ChangeCategoryEvent(this.category);

  @override
  final CategoryEntity category;

  @override
  String toString() {
    return 'TransactionEvent.changeCategory(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCategoryEvent &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCategoryEventCopyWith<_$_ChangeCategoryEvent> get copyWith =>
      __$$_ChangeCategoryEventCopyWithImpl<_$_ChangeCategoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return changeCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return changeCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return changeCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return changeCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoryEvent implements TransactionEvent {
  const factory _ChangeCategoryEvent(final CategoryEntity category) =
      _$_ChangeCategoryEvent;

  CategoryEntity get category;
  @JsonKey(ignore: true)
  _$$_ChangeCategoryEventCopyWith<_$_ChangeCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchDefaultCategoryEventCopyWith<$Res> {
  factory _$$_FetchDefaultCategoryEventCopyWith(
          _$_FetchDefaultCategoryEvent value,
          $Res Function(_$_FetchDefaultCategoryEvent) then) =
      __$$_FetchDefaultCategoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchDefaultCategoryEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_FetchDefaultCategoryEvent>
    implements _$$_FetchDefaultCategoryEventCopyWith<$Res> {
  __$$_FetchDefaultCategoryEventCopyWithImpl(
      _$_FetchDefaultCategoryEvent _value,
      $Res Function(_$_FetchDefaultCategoryEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchDefaultCategoryEvent implements _FetchDefaultCategoryEvent {
  const _$_FetchDefaultCategoryEvent();

  @override
  String toString() {
    return 'TransactionEvent.defaultCategory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDefaultCategoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return defaultCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return defaultCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (defaultCategory != null) {
      return defaultCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return defaultCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return defaultCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (defaultCategory != null) {
      return defaultCategory(this);
    }
    return orElse();
  }
}

abstract class _FetchDefaultCategoryEvent implements TransactionEvent {
  const factory _FetchDefaultCategoryEvent() = _$_FetchDefaultCategoryEvent;
}

/// @nodoc
abstract class _$$_FindTransactionFromIdEventCopyWith<$Res> {
  factory _$$_FindTransactionFromIdEventCopyWith(
          _$_FindTransactionFromIdEvent value,
          $Res Function(_$_FindTransactionFromIdEvent) then) =
      __$$_FindTransactionFromIdEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String? expenseId});
}

/// @nodoc
class __$$_FindTransactionFromIdEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_FindTransactionFromIdEvent>
    implements _$$_FindTransactionFromIdEventCopyWith<$Res> {
  __$$_FindTransactionFromIdEventCopyWithImpl(
      _$_FindTransactionFromIdEvent _value,
      $Res Function(_$_FindTransactionFromIdEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseId = freezed,
  }) {
    return _then(_$_FindTransactionFromIdEvent(
      freezed == expenseId
          ? _value.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FindTransactionFromIdEvent implements _FindTransactionFromIdEvent {
  const _$_FindTransactionFromIdEvent(this.expenseId);

  @override
  final String? expenseId;

  @override
  String toString() {
    return 'TransactionEvent.findTransaction(expenseId: $expenseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FindTransactionFromIdEvent &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expenseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FindTransactionFromIdEventCopyWith<_$_FindTransactionFromIdEvent>
      get copyWith => __$$_FindTransactionFromIdEventCopyWithImpl<
          _$_FindTransactionFromIdEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return findTransaction(expenseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return findTransaction?.call(expenseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (findTransaction != null) {
      return findTransaction(expenseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return findTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return findTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (findTransaction != null) {
      return findTransaction(this);
    }
    return orElse();
  }
}

abstract class _FindTransactionFromIdEvent implements TransactionEvent {
  const factory _FindTransactionFromIdEvent(final String? expenseId) =
      _$_FindTransactionFromIdEvent;

  String? get expenseId;
  @JsonKey(ignore: true)
  _$$_FindTransactionFromIdEventCopyWith<_$_FindTransactionFromIdEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateDateTimeEventCopyWith<$Res> {
  factory _$$_UpdateDateTimeEventCopyWith(_$_UpdateDateTimeEvent value,
          $Res Function(_$_UpdateDateTimeEvent) then) =
      __$$_UpdateDateTimeEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$$_UpdateDateTimeEventCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$_UpdateDateTimeEvent>
    implements _$$_UpdateDateTimeEventCopyWith<$Res> {
  __$$_UpdateDateTimeEventCopyWithImpl(_$_UpdateDateTimeEvent _value,
      $Res Function(_$_UpdateDateTimeEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_$_UpdateDateTimeEvent(
      null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_UpdateDateTimeEvent implements _UpdateDateTimeEvent {
  const _$_UpdateDateTimeEvent(this.dateTime);

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'TransactionEvent.updateDateTime(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDateTimeEvent &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDateTimeEventCopyWith<_$_UpdateDateTimeEvent> get copyWith =>
      __$$_UpdateDateTimeEventCopyWithImpl<_$_UpdateDateTimeEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAdding) addOrUpdate,
    required TResult Function(String expenseId) delete,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(AccountEntity account, bool isFromAccount)
        transferAccount,
    required TResult Function() addRecurring,
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(CategoryEntity category) changeCategory,
    required TResult Function() defaultCategory,
    required TResult Function(String? expenseId) findTransaction,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return updateDateTime(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAdding)? addOrUpdate,
    TResult? Function(String expenseId)? delete,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult? Function()? addRecurring,
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(CategoryEntity category)? changeCategory,
    TResult? Function()? defaultCategory,
    TResult? Function(String? expenseId)? findTransaction,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return updateDateTime?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAdding)? addOrUpdate,
    TResult Function(String expenseId)? delete,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(AccountEntity account, bool isFromAccount)?
        transferAccount,
    TResult Function()? addRecurring,
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(CategoryEntity category)? changeCategory,
    TResult Function()? defaultCategory,
    TResult Function(String? expenseId)? findTransaction,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (updateDateTime != null) {
      return updateDateTime(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrUpdateExpenseEvent value) addOrUpdate,
    required TResult Function(_ClearExpenseEvent value) delete,
    required TResult Function(_ChangeTransactionTypeEvent value)
        changeTransactionType,
    required TResult Function(_TransferAccountEvent value) transferAccount,
    required TResult Function(_AddRecurringEvent value) addRecurring,
    required TResult Function(_ChangeAccountEvent value) changeAccount,
    required TResult Function(_ChangeCategoryEvent value) changeCategory,
    required TResult Function(_FetchDefaultCategoryEvent value) defaultCategory,
    required TResult Function(_FindTransactionFromIdEvent value)
        findTransaction,
    required TResult Function(_UpdateDateTimeEvent value) updateDateTime,
  }) {
    return updateDateTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult? Function(_ClearExpenseEvent value)? delete,
    TResult? Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult? Function(_TransferAccountEvent value)? transferAccount,
    TResult? Function(_AddRecurringEvent value)? addRecurring,
    TResult? Function(_ChangeAccountEvent value)? changeAccount,
    TResult? Function(_ChangeCategoryEvent value)? changeCategory,
    TResult? Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult? Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult? Function(_UpdateDateTimeEvent value)? updateDateTime,
  }) {
    return updateDateTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrUpdateExpenseEvent value)? addOrUpdate,
    TResult Function(_ClearExpenseEvent value)? delete,
    TResult Function(_ChangeTransactionTypeEvent value)? changeTransactionType,
    TResult Function(_TransferAccountEvent value)? transferAccount,
    TResult Function(_AddRecurringEvent value)? addRecurring,
    TResult Function(_ChangeAccountEvent value)? changeAccount,
    TResult Function(_ChangeCategoryEvent value)? changeCategory,
    TResult Function(_FetchDefaultCategoryEvent value)? defaultCategory,
    TResult Function(_FindTransactionFromIdEvent value)? findTransaction,
    TResult Function(_UpdateDateTimeEvent value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (updateDateTime != null) {
      return updateDateTime(this);
    }
    return orElse();
  }
}

abstract class _UpdateDateTimeEvent implements TransactionEvent {
  const factory _UpdateDateTimeEvent(final DateTime dateTime) =
      _$_UpdateDateTimeEvent;

  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$_UpdateDateTimeEventCopyWith<_$_UpdateDateTimeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeAccountStateCopyWith<$Res> {
  factory _$$ChangeAccountStateCopyWith(_$ChangeAccountState value,
          $Res Function(_$ChangeAccountState) then) =
      __$$ChangeAccountStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account});
}

/// @nodoc
class __$$ChangeAccountStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$ChangeAccountState>
    implements _$$ChangeAccountStateCopyWith<$Res> {
  __$$ChangeAccountStateCopyWithImpl(
      _$ChangeAccountState _value, $Res Function(_$ChangeAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$ChangeAccountState(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$ChangeAccountState implements ChangeAccountState {
  const _$ChangeAccountState(this.account);

  @override
  final AccountEntity account;

  @override
  String toString() {
    return 'TransactionState.changeAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeAccountState &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeAccountStateCopyWith<_$ChangeAccountState> get copyWith =>
      __$$ChangeAccountStateCopyWithImpl<_$ChangeAccountState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return changeAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return changeAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeAccount != null) {
      return changeAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return changeAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return changeAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeAccount != null) {
      return changeAccount(this);
    }
    return orElse();
  }
}

abstract class ChangeAccountState implements TransactionState {
  const factory ChangeAccountState(final AccountEntity account) =
      _$ChangeAccountState;

  AccountEntity get account;
  @JsonKey(ignore: true)
  _$$ChangeAccountStateCopyWith<_$ChangeAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTransactionTypeStateCopyWith<$Res> {
  factory _$$ChangeTransactionTypeStateCopyWith(
          _$ChangeTransactionTypeState value,
          $Res Function(_$ChangeTransactionTypeState) then) =
      __$$ChangeTransactionTypeStateCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionType transactionType});
}

/// @nodoc
class __$$ChangeTransactionTypeStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$ChangeTransactionTypeState>
    implements _$$ChangeTransactionTypeStateCopyWith<$Res> {
  __$$ChangeTransactionTypeStateCopyWithImpl(
      _$ChangeTransactionTypeState _value,
      $Res Function(_$ChangeTransactionTypeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
  }) {
    return _then(_$ChangeTransactionTypeState(
      null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ));
  }
}

/// @nodoc

class _$ChangeTransactionTypeState implements ChangeTransactionTypeState {
  const _$ChangeTransactionTypeState(this.transactionType);

  @override
  final TransactionType transactionType;

  @override
  String toString() {
    return 'TransactionState.changeTransactionType(transactionType: $transactionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTransactionTypeState &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTransactionTypeStateCopyWith<_$ChangeTransactionTypeState>
      get copyWith => __$$ChangeTransactionTypeStateCopyWithImpl<
          _$ChangeTransactionTypeState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return changeTransactionType(transactionType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return changeTransactionType?.call(transactionType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeTransactionType != null) {
      return changeTransactionType(transactionType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return changeTransactionType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return changeTransactionType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changeTransactionType != null) {
      return changeTransactionType(this);
    }
    return orElse();
  }
}

abstract class ChangeTransactionTypeState implements TransactionState {
  const factory ChangeTransactionTypeState(
      final TransactionType transactionType) = _$ChangeTransactionTypeState;

  TransactionType get transactionType;
  @JsonKey(ignore: true)
  _$$ChangeTransactionTypeStateCopyWith<_$ChangeTransactionTypeState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCategoryStateCopyWith<$Res> {
  factory _$$ChangeCategoryStateCopyWith(_$ChangeCategoryState value,
          $Res Function(_$ChangeCategoryState) then) =
      __$$ChangeCategoryStateCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryEntity category});
}

/// @nodoc
class __$$ChangeCategoryStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$ChangeCategoryState>
    implements _$$ChangeCategoryStateCopyWith<$Res> {
  __$$ChangeCategoryStateCopyWithImpl(
      _$ChangeCategoryState _value, $Res Function(_$ChangeCategoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$ChangeCategoryState(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ));
  }
}

/// @nodoc

class _$ChangeCategoryState implements ChangeCategoryState {
  const _$ChangeCategoryState(this.category);

  @override
  final CategoryEntity category;

  @override
  String toString() {
    return 'TransactionState.changecCategory(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCategoryState &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoryStateCopyWith<_$ChangeCategoryState> get copyWith =>
      __$$ChangeCategoryStateCopyWithImpl<_$ChangeCategoryState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return changecCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return changecCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changecCategory != null) {
      return changecCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return changecCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return changecCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (changecCategory != null) {
      return changecCategory(this);
    }
    return orElse();
  }
}

abstract class ChangeCategoryState implements TransactionState {
  const factory ChangeCategoryState(final CategoryEntity category) =
      _$ChangeCategoryState;

  CategoryEntity get category;
  @JsonKey(ignore: true)
  _$$ChangeCategoryStateCopyWith<_$ChangeCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DefaultCategoriesStateCopyWith<$Res> {
  factory _$$DefaultCategoriesStateCopyWith(_$DefaultCategoriesState value,
          $Res Function(_$DefaultCategoriesState) then) =
      __$$DefaultCategoriesStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryEntity> categories});
}

/// @nodoc
class __$$DefaultCategoriesStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$DefaultCategoriesState>
    implements _$$DefaultCategoriesStateCopyWith<$Res> {
  __$$DefaultCategoriesStateCopyWithImpl(_$DefaultCategoriesState _value,
      $Res Function(_$DefaultCategoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$DefaultCategoriesState(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
    ));
  }
}

/// @nodoc

class _$DefaultCategoriesState implements DefaultCategoriesState {
  const _$DefaultCategoriesState(final List<CategoryEntity> categories)
      : _categories = categories;

  final List<CategoryEntity> _categories;
  @override
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'TransactionState.defaultCategory(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultCategoriesState &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultCategoriesStateCopyWith<_$DefaultCategoriesState> get copyWith =>
      __$$DefaultCategoriesStateCopyWithImpl<_$DefaultCategoriesState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return defaultCategory(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return defaultCategory?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (defaultCategory != null) {
      return defaultCategory(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return defaultCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return defaultCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (defaultCategory != null) {
      return defaultCategory(this);
    }
    return orElse();
  }
}

abstract class DefaultCategoriesState implements TransactionState {
  const factory DefaultCategoriesState(final List<CategoryEntity> categories) =
      _$DefaultCategoriesState;

  List<CategoryEntity> get categories;
  @JsonKey(ignore: true)
  _$$DefaultCategoriesStateCopyWith<_$DefaultCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpenseInitialCopyWith<$Res> {
  factory _$$ExpenseInitialCopyWith(
          _$ExpenseInitial value, $Res Function(_$ExpenseInitial) then) =
      __$$ExpenseInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpenseInitialCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$ExpenseInitial>
    implements _$$ExpenseInitialCopyWith<$Res> {
  __$$ExpenseInitialCopyWithImpl(
      _$ExpenseInitial _value, $Res Function(_$ExpenseInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExpenseInitial implements ExpenseInitial {
  const _$ExpenseInitial();

  @override
  String toString() {
    return 'TransactionState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpenseInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ExpenseInitial implements TransactionState {
  const factory ExpenseInitial() = _$ExpenseInitial;
}

/// @nodoc
abstract class _$$TransactionFoundStateCopyWith<$Res> {
  factory _$$TransactionFoundStateCopyWith(_$TransactionFoundState value,
          $Res Function(_$TransactionFoundState) then) =
      __$$TransactionFoundStateCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionEntity transaction});
}

/// @nodoc
class __$$TransactionFoundStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionFoundState>
    implements _$$TransactionFoundStateCopyWith<$Res> {
  __$$TransactionFoundStateCopyWithImpl(_$TransactionFoundState _value,
      $Res Function(_$TransactionFoundState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$TransactionFoundState(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionEntity,
    ));
  }
}

/// @nodoc

class _$TransactionFoundState implements TransactionFoundState {
  const _$TransactionFoundState(this.transaction);

  @override
  final TransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionState.transaction(transaction: $transaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFoundState &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFoundStateCopyWith<_$TransactionFoundState> get copyWith =>
      __$$TransactionFoundStateCopyWithImpl<_$TransactionFoundState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return transaction(this.transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return transaction?.call(this.transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transaction != null) {
      return transaction(this.transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return transaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return transaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transaction != null) {
      return transaction(this);
    }
    return orElse();
  }
}

abstract class TransactionFoundState implements TransactionState {
  const factory TransactionFoundState(final TransactionEntity transaction) =
      _$TransactionFoundState;

  TransactionEntity get transaction;
  @JsonKey(ignore: true)
  _$$TransactionFoundStateCopyWith<_$TransactionFoundState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionAddedCopyWith<$Res> {
  factory _$$TransactionAddedCopyWith(
          _$TransactionAdded value, $Res Function(_$TransactionAdded) then) =
      __$$TransactionAddedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAddOrUpdate});
}

/// @nodoc
class __$$TransactionAddedCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionAdded>
    implements _$$TransactionAddedCopyWith<$Res> {
  __$$TransactionAddedCopyWithImpl(
      _$TransactionAdded _value, $Res Function(_$TransactionAdded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddOrUpdate = null,
  }) {
    return _then(_$TransactionAdded(
      isAddOrUpdate: null == isAddOrUpdate
          ? _value.isAddOrUpdate
          : isAddOrUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransactionAdded implements TransactionAdded {
  const _$TransactionAdded({this.isAddOrUpdate = false});

  @override
  @JsonKey()
  final bool isAddOrUpdate;

  @override
  String toString() {
    return 'TransactionState.transactionAdded(isAddOrUpdate: $isAddOrUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionAdded &&
            (identical(other.isAddOrUpdate, isAddOrUpdate) ||
                other.isAddOrUpdate == isAddOrUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAddOrUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionAddedCopyWith<_$TransactionAdded> get copyWith =>
      __$$TransactionAddedCopyWithImpl<_$TransactionAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return transactionAdded(isAddOrUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return transactionAdded?.call(isAddOrUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transactionAdded != null) {
      return transactionAdded(isAddOrUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return transactionAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return transactionAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transactionAdded != null) {
      return transactionAdded(this);
    }
    return orElse();
  }
}

abstract class TransactionAdded implements TransactionState {
  const factory TransactionAdded({final bool isAddOrUpdate}) =
      _$TransactionAdded;

  bool get isAddOrUpdate;
  @JsonKey(ignore: true)
  _$$TransactionAddedCopyWith<_$TransactionAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionDeletedStateCopyWith<$Res> {
  factory _$$TransactionDeletedStateCopyWith(_$TransactionDeletedState value,
          $Res Function(_$TransactionDeletedState) then) =
      __$$TransactionDeletedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionDeletedStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionDeletedState>
    implements _$$TransactionDeletedStateCopyWith<$Res> {
  __$$TransactionDeletedStateCopyWithImpl(_$TransactionDeletedState _value,
      $Res Function(_$TransactionDeletedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionDeletedState implements TransactionDeletedState {
  const _$TransactionDeletedState();

  @override
  String toString() {
    return 'TransactionState.transactionDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDeletedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return transactionDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return transactionDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transactionDeleted != null) {
      return transactionDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return transactionDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return transactionDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transactionDeleted != null) {
      return transactionDeleted(this);
    }
    return orElse();
  }
}

abstract class TransactionDeletedState implements TransactionState {
  const factory TransactionDeletedState() = _$TransactionDeletedState;
}

/// @nodoc
abstract class _$$TransactionErrorStateCopyWith<$Res> {
  factory _$$TransactionErrorStateCopyWith(_$TransactionErrorState value,
          $Res Function(_$TransactionErrorState) then) =
      __$$TransactionErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorString});
}

/// @nodoc
class __$$TransactionErrorStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionErrorState>
    implements _$$TransactionErrorStateCopyWith<$Res> {
  __$$TransactionErrorStateCopyWithImpl(_$TransactionErrorState _value,
      $Res Function(_$TransactionErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorString = null,
  }) {
    return _then(_$TransactionErrorState(
      null == errorString
          ? _value.errorString
          : errorString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionErrorState implements TransactionErrorState {
  const _$TransactionErrorState(this.errorString);

  @override
  final String errorString;

  @override
  String toString() {
    return 'TransactionState.transactionError(errorString: $errorString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionErrorState &&
            (identical(other.errorString, errorString) ||
                other.errorString == errorString));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionErrorStateCopyWith<_$TransactionErrorState> get copyWith =>
      __$$TransactionErrorStateCopyWithImpl<_$TransactionErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return transactionError(errorString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return transactionError?.call(errorString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transactionError != null) {
      return transactionError(errorString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return transactionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return transactionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transactionError != null) {
      return transactionError(this);
    }
    return orElse();
  }
}

abstract class TransactionErrorState implements TransactionState {
  const factory TransactionErrorState(final String errorString) =
      _$TransactionErrorState;

  String get errorString;
  @JsonKey(ignore: true)
  _$$TransactionErrorStateCopyWith<_$TransactionErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferAccountStateCopyWith<$Res> {
  factory _$$TransferAccountStateCopyWith(_$TransferAccountState value,
          $Res Function(_$TransferAccountState) then) =
      __$$TransferAccountStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AccountEntity? fromAccount,
      AccountEntity? toAccount,
      bool isFromAccount});
}

/// @nodoc
class __$$TransferAccountStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransferAccountState>
    implements _$$TransferAccountStateCopyWith<$Res> {
  __$$TransferAccountStateCopyWithImpl(_$TransferAccountState _value,
      $Res Function(_$TransferAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromAccount = freezed,
    Object? toAccount = freezed,
    Object? isFromAccount = null,
  }) {
    return _then(_$TransferAccountState(
      fromAccount: freezed == fromAccount
          ? _value.fromAccount
          : fromAccount // ignore: cast_nullable_to_non_nullable
              as AccountEntity?,
      toAccount: freezed == toAccount
          ? _value.toAccount
          : toAccount // ignore: cast_nullable_to_non_nullable
              as AccountEntity?,
      isFromAccount: null == isFromAccount
          ? _value.isFromAccount
          : isFromAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransferAccountState implements TransferAccountState {
  const _$TransferAccountState(
      {this.fromAccount, this.toAccount, this.isFromAccount = false});

  @override
  final AccountEntity? fromAccount;
  @override
  final AccountEntity? toAccount;
  @override
  @JsonKey()
  final bool isFromAccount;

  @override
  String toString() {
    return 'TransactionState.transferAccount(fromAccount: $fromAccount, toAccount: $toAccount, isFromAccount: $isFromAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferAccountState &&
            (identical(other.fromAccount, fromAccount) ||
                other.fromAccount == fromAccount) &&
            (identical(other.toAccount, toAccount) ||
                other.toAccount == toAccount) &&
            (identical(other.isFromAccount, isFromAccount) ||
                other.isFromAccount == isFromAccount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fromAccount, toAccount, isFromAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferAccountStateCopyWith<_$TransferAccountState> get copyWith =>
      __$$TransferAccountStateCopyWithImpl<_$TransferAccountState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return transferAccount(fromAccount, toAccount, isFromAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return transferAccount?.call(fromAccount, toAccount, isFromAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transferAccount != null) {
      return transferAccount(fromAccount, toAccount, isFromAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return transferAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return transferAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (transferAccount != null) {
      return transferAccount(this);
    }
    return orElse();
  }
}

abstract class TransferAccountState implements TransactionState {
  const factory TransferAccountState(
      {final AccountEntity? fromAccount,
      final AccountEntity? toAccount,
      final bool isFromAccount}) = _$TransferAccountState;

  AccountEntity? get fromAccount;
  AccountEntity? get toAccount;
  bool get isFromAccount;
  @JsonKey(ignore: true)
  _$$TransferAccountStateCopyWith<_$TransferAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDateTimeStateCopyWith<$Res> {
  factory _$$UpdateDateTimeStateCopyWith(_$UpdateDateTimeState value,
          $Res Function(_$UpdateDateTimeState) then) =
      __$$UpdateDateTimeStateCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$$UpdateDateTimeStateCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$UpdateDateTimeState>
    implements _$$UpdateDateTimeStateCopyWith<$Res> {
  __$$UpdateDateTimeStateCopyWithImpl(
      _$UpdateDateTimeState _value, $Res Function(_$UpdateDateTimeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_$UpdateDateTimeState(
      null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UpdateDateTimeState implements UpdateDateTimeState {
  const _$UpdateDateTimeState(this.dateTime);

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'TransactionState.updateDateTime(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDateTimeState &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDateTimeStateCopyWith<_$UpdateDateTimeState> get copyWith =>
      __$$UpdateDateTimeStateCopyWithImpl<_$UpdateDateTimeState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountEntity account) changeAccount,
    required TResult Function(TransactionType transactionType)
        changeTransactionType,
    required TResult Function(CategoryEntity category) changecCategory,
    required TResult Function(List<CategoryEntity> categories) defaultCategory,
    required TResult Function() initial,
    required TResult Function(TransactionEntity transaction) transaction,
    required TResult Function(bool isAddOrUpdate) transactionAdded,
    required TResult Function() transactionDeleted,
    required TResult Function(String errorString) transactionError,
    required TResult Function(AccountEntity? fromAccount,
            AccountEntity? toAccount, bool isFromAccount)
        transferAccount,
    required TResult Function(DateTime dateTime) updateDateTime,
  }) {
    return updateDateTime(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountEntity account)? changeAccount,
    TResult? Function(TransactionType transactionType)? changeTransactionType,
    TResult? Function(CategoryEntity category)? changecCategory,
    TResult? Function(List<CategoryEntity> categories)? defaultCategory,
    TResult? Function()? initial,
    TResult? Function(TransactionEntity transaction)? transaction,
    TResult? Function(bool isAddOrUpdate)? transactionAdded,
    TResult? Function()? transactionDeleted,
    TResult? Function(String errorString)? transactionError,
    TResult? Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult? Function(DateTime dateTime)? updateDateTime,
  }) {
    return updateDateTime?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountEntity account)? changeAccount,
    TResult Function(TransactionType transactionType)? changeTransactionType,
    TResult Function(CategoryEntity category)? changecCategory,
    TResult Function(List<CategoryEntity> categories)? defaultCategory,
    TResult Function()? initial,
    TResult Function(TransactionEntity transaction)? transaction,
    TResult Function(bool isAddOrUpdate)? transactionAdded,
    TResult Function()? transactionDeleted,
    TResult Function(String errorString)? transactionError,
    TResult Function(AccountEntity? fromAccount, AccountEntity? toAccount,
            bool isFromAccount)?
        transferAccount,
    TResult Function(DateTime dateTime)? updateDateTime,
    required TResult orElse(),
  }) {
    if (updateDateTime != null) {
      return updateDateTime(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeAccountState value) changeAccount,
    required TResult Function(ChangeTransactionTypeState value)
        changeTransactionType,
    required TResult Function(ChangeCategoryState value) changecCategory,
    required TResult Function(DefaultCategoriesState value) defaultCategory,
    required TResult Function(ExpenseInitial value) initial,
    required TResult Function(TransactionFoundState value) transaction,
    required TResult Function(TransactionAdded value) transactionAdded,
    required TResult Function(TransactionDeletedState value) transactionDeleted,
    required TResult Function(TransactionErrorState value) transactionError,
    required TResult Function(TransferAccountState value) transferAccount,
    required TResult Function(UpdateDateTimeState value) updateDateTime,
  }) {
    return updateDateTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeAccountState value)? changeAccount,
    TResult? Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult? Function(ChangeCategoryState value)? changecCategory,
    TResult? Function(DefaultCategoriesState value)? defaultCategory,
    TResult? Function(ExpenseInitial value)? initial,
    TResult? Function(TransactionFoundState value)? transaction,
    TResult? Function(TransactionAdded value)? transactionAdded,
    TResult? Function(TransactionDeletedState value)? transactionDeleted,
    TResult? Function(TransactionErrorState value)? transactionError,
    TResult? Function(TransferAccountState value)? transferAccount,
    TResult? Function(UpdateDateTimeState value)? updateDateTime,
  }) {
    return updateDateTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeAccountState value)? changeAccount,
    TResult Function(ChangeTransactionTypeState value)? changeTransactionType,
    TResult Function(ChangeCategoryState value)? changecCategory,
    TResult Function(DefaultCategoriesState value)? defaultCategory,
    TResult Function(ExpenseInitial value)? initial,
    TResult Function(TransactionFoundState value)? transaction,
    TResult Function(TransactionAdded value)? transactionAdded,
    TResult Function(TransactionDeletedState value)? transactionDeleted,
    TResult Function(TransactionErrorState value)? transactionError,
    TResult Function(TransferAccountState value)? transferAccount,
    TResult Function(UpdateDateTimeState value)? updateDateTime,
    required TResult orElse(),
  }) {
    if (updateDateTime != null) {
      return updateDateTime(this);
    }
    return orElse();
  }
}

abstract class UpdateDateTimeState implements TransactionState {
  const factory UpdateDateTimeState(final DateTime dateTime) =
      _$UpdateDateTimeState;

  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$UpdateDateTimeStateCopyWith<_$UpdateDateTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}
