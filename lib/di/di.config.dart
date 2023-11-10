// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i20;
import 'package:event_bus_plus/event_bus_plus.dart' as _i21;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i6;
import 'package:hive_flutter/hive_flutter.dart' as _i31;
import 'package:image_picker/image_picker.dart' as _i24;
import 'package:in_app_review/in_app_review.dart' as _i25;
import 'package:in_app_update/in_app_update.dart' as _i26;
import 'package:injectable/injectable.dart' as _i2;

import '../features/account/data/data_sources/account_manager.dart' as _i3;
import '../features/account/data/data_sources/local/local_account_manager_impl.dart'
    as _i47;
import '../features/account/data/data_sources/remote/remote_account_data_manager_impl.dart'
    as _i4;
import '../features/account/data/model/account_model.dart' as _i7;
import '../features/account/data/repository/account_repository_impl.dart'
    as _i49;
import '../features/account/domain/repository/account_repository.dart' as _i48;
import '../features/account/domain/use_case/account_use_case.dart' as _i82;
import '../features/account/domain/use_case/add_account_use_case.dart' as _i50;
import '../features/account/domain/use_case/delete_account_use_case.dart'
    as _i59;
import '../features/account/domain/use_case/get_account_use_case.dart' as _i70;
import '../features/account/domain/use_case/get_accounts_use_case.dart' as _i71;
import '../features/account/domain/use_case/update_account_use_case.dart'
    as _i94;
import '../features/account/presentation/bloc/accounts_bloc.dart' as _i96;
import '../features/category/data/data_sources/local/category_data_source.dart'
    as _i27;
import '../features/category/data/model/category_model.dart' as _i12;
import '../features/category/data/repository/category_repository_impl.dart'
    as _i55;
import '../features/category/domain/repository/category_repository.dart'
    as _i54;
import '../features/category/domain/use_case/add_category_use_case.dart'
    as _i97;
import '../features/category/domain/use_case/category_use_case.dart' as _i81;
import '../features/category/domain/use_case/delete_category_use_case.dart'
    as _i60;
import '../features/category/domain/use_case/get_category_use_case.dart'
    as _i72;
import '../features/category/domain/use_case/get_default_categories_use_case.dart'
    as _i74;
import '../features/category/domain/use_case/update_category_use_case.dart'
    as _i95;
import '../features/category/presentation/bloc/category_bloc.dart' as _i100;
import '../features/country_picker/data/repository/country_repository_impl.dart'
    as _i14;
import '../features/country_picker/domain/repository/country_repository.dart'
    as _i13;
import '../features/country_picker/domain/use_case/get_contries_user_case.dart'
    as _i22;
import '../features/debit/data/data_sources/debit_data_manager.dart' as _i15;
import '../features/debit/data/data_sources/local/debit_manager_impl.dart'
    as _i16;
import '../features/debit/data/data_sources/local/transaction_manager_impl.dart'
    as _i42;
import '../features/debit/data/data_sources/transaction_data_manager.dart'
    as _i41;
import '../features/debit/data/models/debit_model.dart' as _i10;
import '../features/debit/data/models/debit_transactions_model.dart' as _i8;
import '../features/debit/data/repository/debit_repository_impl.dart' as _i18;
import '../features/debit/data/repository/debit_transaction_impl.dart' as _i58;
import '../features/debit/domain/repository/debit_repository.dart' as _i17;
import '../features/debit/domain/repository/debit_transaction_repository.dart'
    as _i57;
import '../features/debit/domain/use_case/add_debit_transaction_use_case.dart'
    as _i98;
import '../features/debit/domain/use_case/add_debit_use.case.dart' as _i51;
import '../features/debit/domain/use_case/debit_use_case.dart' as _i102;
import '../features/debit/domain/use_case/delete_debit_transaction_use_case.dart'
    as _i61;
import '../features/debit/domain/use_case/delete_debit_transactions_by_debit_id_use_case.dart'
    as _i62;
import '../features/debit/domain/use_case/delete_debit_use_case.dart' as _i19;
import '../features/debit/domain/use_case/get_debit_transactions_use_case.dart'
    as _i73;
import '../features/debit/domain/use_case/get_debit_use_case.dart' as _i23;
import '../features/debit/domain/use_case/update_debit_use.case.dart' as _i45;
import '../features/debit/presentation/cubit/debts_bloc.dart' as _i101;
import '../features/home/presentation/bloc/home/home_bloc.dart' as _i79;
import '../features/home/presentation/controller/summary_controller.dart'
    as _i39;
import '../features/home/presentation/cubit/overview/overview_cubit.dart'
    as _i86;
import '../features/home/presentation/cubit/summary/summary_cubit.dart' as _i92;
import '../features/intro/presentation/cubit/country_picker_cubit.dart' as _i56;
import '../features/profile/data/repository/profile_repository_impl.dart'
    as _i33;
import '../features/profile/domain/repository/profile_repository.dart' as _i32;
import '../features/profile/domain/use_case/image_picker_use_case.dart' as _i83;
import '../features/profile/domain/use_case/profile_use_case.dart' as _i88;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i87;
import '../features/recurring/data/data_sources/local_recurring_data_manager.dart'
    as _i28;
import '../features/recurring/data/data_sources/local_recurring_data_manager_impl.dart'
    as _i29;
import '../features/recurring/data/model/recurring.dart' as _i11;
import '../features/recurring/data/repository/recurring_repository_impl.dart'
    as _i35;
import '../features/recurring/domain/repository/recurring_repository.dart'
    as _i34;
import '../features/recurring/domain/use_case/add_recurring_use_case.dart'
    as _i52;
import '../features/recurring/domain/use_case/recurring_use_case.dart' as _i90;
import '../features/recurring/presentation/cubit/recurring_cubit.dart' as _i89;
import '../features/search/domain/use_case/filter_expense_use_case.dart'
    as _i91;
import '../features/search/presentation/cubit/search_cubit.dart' as _i103;
import '../features/settings/data/authenticate.dart' as _i5;
import '../features/settings/data/file_handler.dart' as _i69;
import '../features/settings/data/repository/csv_export_impl.dart' as _i67;
import '../features/settings/data/repository/json_export_import_impl.dart'
    as _i68;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i37;
import '../features/settings/domain/repository/import_export.dart' as _i66;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i36;
import '../features/settings/domain/use_case/csv_file_export_use_case.dart'
    as _i99;
import '../features/settings/domain/use_case/json_file_export_use_case.dart'
    as _i84;
import '../features/settings/domain/use_case/json_file_import_use_case.dart'
    as _i85;
import '../features/settings/domain/use_case/setting_use_case.dart' as _i40;
import '../features/settings/domain/use_case/settings_use_case.dart' as _i38;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i104;
import '../features/transaction/data/data_sources/local/transaction_data_manager.dart'
    as _i30;
import '../features/transaction/data/model/transaction_model.dart' as _i9;
import '../features/transaction/data/repository/transaction_repository_impl.dart'
    as _i44;
import '../features/transaction/domain/repository/transaction_repository.dart'
    as _i43;
import '../features/transaction/domain/use_case/add_transaction_use_case.dart'
    as _i53;
import '../features/transaction/domain/use_case/delete_transaction_from_category_id_use_case.dart'
    as _i65;
import '../features/transaction/domain/use_case/delete_transaction_use_case.dart'
    as _i63;
import '../features/transaction/domain/use_case/delete_transactions_by_account_id_use_case.dart'
    as _i64;
import '../features/transaction/domain/use_case/get_transaction_use_case.dart'
    as _i75;
import '../features/transaction/domain/use_case/get_transactions_by_account_id_use_case.dart'
    as _i76;
import '../features/transaction/domain/use_case/get_transactions_by_category_id_use_case.dart'
    as _i77;
import '../features/transaction/domain/use_case/get_transactions_use_case.dart'
    as _i78;
import '../features/transaction/domain/use_case/transaction_use_case.dart'
    as _i80;
import '../features/transaction/domain/use_case/update_expense_use_case.dart'
    as _i46;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i93;
import 'module/hive_module.dart' as _i105;
import 'module/service_module.dart' as _i106;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final hiveBoxModule = _$HiveBoxModule();
  final serviceBoxModule = _$ServiceBoxModule();
  gh.singleton<_i3.AccountManager>(
    _i4.RemoteAccountManagerImpl(),
    instanceName: 'remote-account',
  );
  gh.singleton<_i5.Authenticate>(_i5.Authenticate());
  await gh.singletonAsync<_i6.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic,
    instanceName: 'settings',
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i7.AccountModel>>(
    () => hiveBoxModule.accountBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i8.DebitTransactionsModel>>(
    () => hiveBoxModule.transactionsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i9.TransactionModel>>(
    () => hiveBoxModule.expenseBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i10.DebitModel>>(
    () => hiveBoxModule.debtsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i11.RecurringModel>>(
    () => hiveBoxModule.recurringBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i12.CategoryModel>>(
    () => hiveBoxModule.categoryBox,
    preResolve: true,
  );
  gh.singleton<_i13.CountryRepository>(_i14.CountryRepositoryImpl());
  gh.singleton<_i15.DebitDataManager>(
      _i16.LocalDebitDataManagerImpl(debtBox: gh<_i6.Box<_i10.DebitModel>>()));
  gh.singleton<_i17.DebitRepository>(
      _i18.DebtRepositoryImpl(gh<_i15.DebitDataManager>()));
  gh.singleton<_i19.DeleteDebitUseCase>(
      _i19.DeleteDebitUseCase(debtRepository: gh<_i17.DebitRepository>()));
  gh.singleton<_i20.DeviceInfoPlugin>(
      serviceBoxModule.providesDeviceInfoPlugin());
  gh.singleton<_i21.EventBus>(serviceBoxModule.providerEventBus());
  gh.factory<_i22.GetCountriesUseCase>(
      () => _i22.GetCountriesUseCase(repository: gh<_i13.CountryRepository>()));
  gh.singleton<_i23.GetDebitUseCase>(
      _i23.GetDebitUseCase(debtRepository: gh<_i17.DebitRepository>()));
  gh.singleton<_i24.ImagePicker>(serviceBoxModule.providesImagePicker());
  gh.singleton<_i25.InAppReview>(serviceBoxModule.providesInAppReview());
  gh.singleton<_i26.InAppUpdate>(serviceBoxModule.providesInAppUpdate());
  gh.singleton<_i27.LocalCategoryManager>(
      _i27.LocalCategoryManagerDataSourceImpl(
          gh<_i6.Box<_i12.CategoryModel>>()));
  gh.factory<_i28.LocalRecurringDataManager>(() =>
      _i29.LocalRecurringDataManagerImpl(gh<_i6.Box<_i11.RecurringModel>>()));
  gh.factory<_i30.LocalTransactionManager>(() =>
      _i30.LocalTransactionManagerImpl(gh<_i31.Box<_i9.TransactionModel>>()));
  gh.singleton<_i32.ProfileRepository>(_i33.ProfileRepositoryImpl(
    gh<_i24.ImagePicker>(),
    gh<_i6.Box<dynamic>>(instanceName: 'settings'),
  ));
  gh.singleton<_i34.RecurringRepository>(_i35.RecurringRepositoryImpl(
    gh<_i28.LocalRecurringDataManager>(),
    gh<_i30.LocalTransactionManager>(),
  ));
  gh.factory<_i36.SettingsRepository>(() => _i37.SettingsRepositoryImpl(
      gh<_i6.Box<dynamic>>(instanceName: 'settings')));
  gh.singleton<_i38.SettingsUseCase>(
      _i38.SettingsUseCase(gh<_i36.SettingsRepository>()));
  gh.singleton<_i39.SummaryController>(
      _i39.SummaryController(gh<_i40.SettingsUseCase>()));
  gh.singleton<_i41.TransactionDataManager>(
      _i42.LocalTransactionDataManagerImpl(
          transactionsBox: gh<_i6.Box<_i8.DebitTransactionsModel>>()));
  gh.singleton<_i43.TransactionRepository>(_i44.ExpenseRepositoryImpl(
      dataSource: gh<_i30.LocalTransactionManager>()));
  gh.singleton<_i45.UpdateDebitUseCase>(
      _i45.UpdateDebitUseCase(debtRepository: gh<_i17.DebitRepository>()));
  gh.singleton<_i46.UpdateTransactionUseCase>(_i46.UpdateTransactionUseCase(
      expenseRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i3.AccountManager>(
    _i47.LocalAccountManagerImpl(accountBox: gh<_i6.Box<_i7.AccountModel>>()),
    instanceName: 'local-account',
  );
  gh.singleton<_i48.AccountRepository>(_i49.AccountRepositoryImpl(
      dataSource: gh<_i3.AccountManager>(instanceName: 'local-account')));
  gh.singleton<_i50.AddAccountUseCase>(
      _i50.AddAccountUseCase(accountRepository: gh<_i48.AccountRepository>()));
  gh.singleton<_i51.AddDebitUseCase>(
      _i51.AddDebitUseCase(debtRepository: gh<_i17.DebitRepository>()));
  gh.singleton<_i52.AddRecurringUseCase>(
      _i52.AddRecurringUseCase(gh<_i34.RecurringRepository>()));
  gh.singleton<_i53.AddTransactionUseCase>(_i53.AddTransactionUseCase(
      expenseRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i54.CategoryRepository>(_i55.CategoryRepositoryImpl(
    dataSources: gh<_i27.LocalCategoryManager>(),
    expenseDataManager: gh<_i30.LocalTransactionManager>(),
  ));
  gh.factory<_i56.CountryPickerCubit>(() => _i56.CountryPickerCubit(
        gh<_i22.GetCountriesUseCase>(),
        gh<_i40.SettingsUseCase>(),
      ));
  gh.singleton<_i57.DebitTransactionRepository>(
      _i58.DebitTransactionRepositoryImpl(
          localTransactionDataManager: gh<_i41.TransactionDataManager>()));
  gh.singleton<_i59.DeleteAccountUseCase>(_i59.DeleteAccountUseCase(
      accountRepository: gh<_i48.AccountRepository>()));
  gh.singleton<_i60.DeleteCategoryUseCase>(_i60.DeleteCategoryUseCase(
      categoryRepository: gh<_i54.CategoryRepository>()));
  gh.singleton<_i61.DeleteDebitTransactionUseCase>(
      _i61.DeleteDebitTransactionUseCase(
          debtRepository: gh<_i57.DebitTransactionRepository>()));
  gh.singleton<_i62.DeleteDebitTransactionsByDebitIdUseCase>(
      _i62.DeleteDebitTransactionsByDebitIdUseCase(
          debtRepository: gh<_i57.DebitTransactionRepository>()));
  gh.singleton<_i63.DeleteTransactionUseCase>(_i63.DeleteTransactionUseCase(
      expenseRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i64.DeleteTransactionsByAccountIdUseCase>(
      _i64.DeleteTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i65.DeleteTransactionsByCategoryIdUseCase>(
      _i65.DeleteTransactionsByCategoryIdUseCase(
          transactionRepository: gh<_i43.TransactionRepository>()));
  gh.lazySingleton<_i66.Export>(
    () => _i67.CSVExport(
      gh<_i20.DeviceInfoPlugin>(),
      gh<_i3.AccountManager>(instanceName: 'local-account'),
      gh<_i27.LocalCategoryManager>(),
      gh<_i30.LocalTransactionManager>(),
    ),
    instanceName: 'csv',
  );
  gh.lazySingleton<_i66.Export>(
    () => _i68.JSONExportImpl(
      gh<_i3.AccountManager>(instanceName: 'local-account'),
      gh<_i27.LocalCategoryManager>(),
      gh<_i30.LocalTransactionManager>(),
      gh<_i15.DebitDataManager>(),
      gh<_i41.TransactionDataManager>(),
    ),
    instanceName: 'json_export',
  );
  gh.singleton<_i69.FileHandler>(_i69.FileHandler(
    gh<_i20.DeviceInfoPlugin>(),
    gh<_i3.AccountManager>(instanceName: 'local-account'),
    gh<_i27.LocalCategoryManager>(),
    gh<_i30.LocalTransactionManager>(),
  ));
  gh.singleton<_i70.GetAccountUseCase>(
      _i70.GetAccountUseCase(accountRepository: gh<_i48.AccountRepository>()));
  gh.singleton<_i71.GetAccountsUseCase>(
      _i71.GetAccountsUseCase(accountRepository: gh<_i48.AccountRepository>()));
  gh.singleton<_i72.GetCategoryUseCase>(_i72.GetCategoryUseCase(
      categoryRepository: gh<_i54.CategoryRepository>()));
  gh.singleton<_i73.GetDebitTransactionsUseCase>(
      _i73.GetDebitTransactionsUseCase(
          debtRepository: gh<_i57.DebitTransactionRepository>()));
  gh.singleton<_i74.GetDefaultCategoriesUseCase>(
      _i74.GetDefaultCategoriesUseCase(
          categoryRepository: gh<_i54.CategoryRepository>()));
  gh.singleton<_i75.GetTransactionUseCase>(_i75.GetTransactionUseCase(
      transactionRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i76.GetTransactionsByAccountIdUseCase>(
      _i76.GetTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i77.GetTransactionsByCategoryIdUseCase>(
      _i77.GetTransactionsByCategoryIdUseCase(
          expenseRepository: gh<_i43.TransactionRepository>()));
  gh.singleton<_i78.GetTransactionsUseCase>(_i78.GetTransactionsUseCase(
      expenseRepository: gh<_i43.TransactionRepository>()));
  gh.factory<_i79.HomeBloc>(() => _i79.HomeBloc(
        gh<_i80.GetTransactionsUseCase>(),
        gh<_i81.GetDefaultCategoriesUseCase>(),
        gh<_i82.GetAccountUseCase>(),
        gh<_i81.GetCategoryUseCase>(),
        gh<_i80.GetTransactionsByCategoryIdUseCase>(),
      ));
  gh.singleton<_i83.ImagePickerUseCase>(
      _i83.ImagePickerUseCase(gh<_i32.ProfileRepository>()));
  gh.lazySingleton<_i66.Import>(
    () => _i68.JSONImportImpl(
      gh<_i20.DeviceInfoPlugin>(),
      gh<_i3.AccountManager>(instanceName: 'local-account'),
      gh<_i27.LocalCategoryManager>(),
      gh<_i30.LocalTransactionManager>(),
      gh<_i41.TransactionDataManager>(),
      gh<_i15.DebitDataManager>(),
    ),
    instanceName: 'json_import',
  );
  gh.singleton<_i84.JSONFileExportUseCase>(_i84.JSONFileExportUseCase(
    gh<_i36.SettingsRepository>(),
    gh<_i66.Export>(instanceName: 'json_export'),
  ));
  gh.singleton<_i85.JSONFileImportUseCase>(_i85.JSONFileImportUseCase(
    gh<_i36.SettingsRepository>(),
    gh<_i66.Import>(instanceName: 'json_import'),
  ));
  gh.factory<_i86.OverviewCubit>(() => _i86.OverviewCubit(
        gh<_i80.GetTransactionsUseCase>(),
        gh<_i81.GetCategoryUseCase>(),
        gh<_i81.GetDefaultCategoriesUseCase>(),
      ));
  gh.factory<_i87.ProfileCubit>(() => _i87.ProfileCubit(
        gh<_i88.ImagePickerUseCase>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.factory<_i89.RecurringCubit>(
      () => _i89.RecurringCubit(gh<_i90.AddRecurringUseCase>()));
  gh.singleton<_i91.SearchUseCase>(
      _i91.SearchUseCase(gh<_i43.TransactionRepository>()));
  gh.factory<_i92.SummaryCubit>(() => _i92.SummaryCubit(
        gh<_i21.EventBus>(),
        gh<_i80.GetTransactionsUseCase>(),
        gh<_i82.GetAccountsUseCase>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.factory<_i93.TransactionBloc>(() => _i93.TransactionBloc(
        gh<_i38.SettingsUseCase>(),
        gh<_i21.EventBus>(),
        getTransactionUseCase: gh<_i80.GetTransactionUseCase>(),
        accountUseCase: gh<_i82.GetAccountUseCase>(),
        addTransactionUseCase: gh<_i80.AddTransactionUseCase>(),
        deleteTransactionUseCase: gh<_i80.DeleteTransactionUseCase>(),
        updateTransactionUseCase: gh<_i80.UpdateTransactionUseCase>(),
        accountsUseCase: gh<_i82.GetAccountsUseCase>(),
        getDefaultCategoriesUseCase: gh<_i81.GetDefaultCategoriesUseCase>(),
      ));
  gh.singleton<_i94.UpdateAccountUseCase>(_i94.UpdateAccountUseCase(
      accountRepository: gh<_i48.AccountRepository>()));
  gh.singleton<_i95.UpdateCategoryUseCase>(_i95.UpdateCategoryUseCase(
      categoryRepository: gh<_i54.CategoryRepository>()));
  gh.factory<_i96.AccountBloc>(() => _i96.AccountBloc(
        gh<_i82.GetAccountUseCase>(),
        gh<_i82.DeleteAccountUseCase>(),
        gh<_i80.GetTransactionsByAccountIdUseCase>(),
        gh<_i82.AddAccountUseCase>(),
        gh<_i72.GetCategoryUseCase>(),
        gh<_i80.DeleteTransactionsByAccountIdUseCase>(),
        gh<_i82.UpdateAccountUseCase>(),
        gh<_i22.GetCountriesUseCase>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.singleton<_i97.AddCategoryUseCase>(_i97.AddCategoryUseCase(
      categoryRepository: gh<_i54.CategoryRepository>()));
  gh.singleton<_i98.AddDebitTransactionUseCase>(_i98.AddDebitTransactionUseCase(
      debtRepository: gh<_i57.DebitTransactionRepository>()));
  gh.singleton<_i99.CSVFileExportUseCase>(_i99.CSVFileExportUseCase(
    gh<_i36.SettingsRepository>(),
    gh<_i66.Export>(instanceName: 'csv'),
  ));
  gh.factory<_i100.CategoryBloc>(() => _i100.CategoryBloc(
        getCategoryUseCase: gh<_i81.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i81.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i81.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i80.DeleteTransactionsByCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i81.UpdateCategoryUseCase>(),
      ));
  gh.factory<_i101.DebitBloc>(() => _i101.DebitBloc(
        addDebtUseCase: gh<_i102.AddDebitUseCase>(),
        getDebtUseCase: gh<_i102.GetDebitUseCase>(),
        getTransactionsUseCase: gh<_i102.GetDebitTransactionsUseCase>(),
        addTransactionUseCase: gh<_i102.AddDebitTransactionUseCase>(),
        updateDebtUseCase: gh<_i102.UpdateDebitUseCase>(),
        deleteDebtUseCase: gh<_i102.DeleteDebitUseCase>(),
        deleteDebitTransactionUseCase:
            gh<_i102.DeleteDebitTransactionUseCase>(),
        deleteDebitTransactionsByDebitIdUseCase:
            gh<_i62.DeleteDebitTransactionsByDebitIdUseCase>(),
      ));
  gh.factory<_i103.SearchCubit>(
      () => _i103.SearchCubit(gh<_i91.SearchUseCase>()));
  gh.factory<_i104.SettingCubit>(() => _i104.SettingCubit(
        gh<_i80.GetTransactionsUseCase>(),
        gh<_i81.GetDefaultCategoriesUseCase>(),
        gh<_i80.UpdateTransactionUseCase>(),
        gh<_i40.JSONFileImportUseCase>(),
        gh<_i40.JSONFileExportUseCase>(),
        gh<_i40.SettingsUseCase>(),
        gh<_i40.CSVFileExportUseCase>(),
      ));
  return getIt;
}

class _$HiveBoxModule extends _i105.HiveBoxModule {}

class _$ServiceBoxModule extends _i106.ServiceBoxModule {}
