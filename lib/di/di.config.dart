// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i15;
import 'package:event_bus_plus/event_bus_plus.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i6;
import 'package:hive_flutter/hive_flutter.dart' as _i25;
import 'package:image_picker/image_picker.dart' as _i18;
import 'package:in_app_review/in_app_review.dart' as _i19;
import 'package:injectable/injectable.dart' as _i2;

import '../core/in_app.dart' as _i76;
import '../features/account/data/data_sources/account_manager.dart' as _i3;
import '../features/account/data/data_sources/local/account_data_manager.dart'
    as _i38;
import '../features/account/data/data_sources/remote/remote_account_data_manager.dart'
    as _i4;
import '../features/account/data/model/account_model.dart' as _i12;
import '../features/account/data/repository/account_repository_impl.dart'
    as _i40;
import '../features/account/domain/repository/account_repository.dart' as _i39;
import '../features/account/domain/use_case/account_use_case.dart' as _i74;
import '../features/account/domain/use_case/add_account_use_case.dart' as _i41;
import '../features/account/domain/use_case/delete_account_use_case.dart'
    as _i49;
import '../features/account/domain/use_case/get_account_use_case.dart' as _i61;
import '../features/account/domain/use_case/get_accounts_use_case.dart' as _i62;
import '../features/account/domain/use_case/update_account_use_case.dart'
    as _i87;
import '../features/account/presentation/bloc/accounts_bloc.dart' as _i90;
import '../features/category/data/data_sources/local/category_data_source.dart'
    as _i20;
import '../features/category/data/model/category_model.dart' as _i11;
import '../features/category/data/repository/category_repository_impl.dart'
    as _i45;
import '../features/category/domain/repository/category_repository.dart'
    as _i44;
import '../features/category/domain/use_case/add_category_use_case.dart'
    as _i91;
import '../features/category/domain/use_case/category_use_case.dart' as _i73;
import '../features/category/domain/use_case/delete_category_use_case.dart'
    as _i50;
import '../features/category/domain/use_case/get_category_use_case.dart'
    as _i63;
import '../features/category/domain/use_case/get_default_categories_use_case.dart'
    as _i66;
import '../features/category/domain/use_case/update_category_use_case.dart'
    as _i88;
import '../features/category/presentation/bloc/category_bloc.dart' as _i95;
import '../features/country_picker/data/repository/country_repository_impl.dart'
    as _i14;
import '../features/country_picker/domain/repository/country_repository.dart'
    as _i13;
import '../features/country_picker/domain/use_case/get_contries_user_case.dart'
    as _i17;
import '../features/country_picker/presentation/cubit/country_picker_cubit.dart'
    as _i46;
import '../features/debit/data/data_sources/local/debit_local_data_source_impl.dart'
    as _i21;
import '../features/debit/data/models/debit_model.dart' as _i7;
import '../features/debit/data/models/debit_transactions_model.dart' as _i8;
import '../features/debit/data/repository/debit_repository_impl.dart' as _i48;
import '../features/debit/domain/repository/debit_repository.dart' as _i47;
import '../features/debit/domain/use_case/add_debit_transaction_use_case.dart'
    as _i92;
import '../features/debit/domain/use_case/add_debit_use.case.dart' as _i93;
import '../features/debit/domain/use_case/debit_use_case.dart' as _i97;
import '../features/debit/domain/use_case/delete_debit_transaction_use_case.dart'
    as _i51;
import '../features/debit/domain/use_case/delete_debit_transactions_by_debit_id_use_case.dart'
    as _i52;
import '../features/debit/domain/use_case/delete_debit_use_case.dart' as _i53;
import '../features/debit/domain/use_case/get_debit_transactions_use_case.dart'
    as _i64;
import '../features/debit/domain/use_case/get_debit_use_case.dart' as _i65;
import '../features/debit/domain/use_case/update_debit_use.case.dart' as _i89;
import '../features/debit/presentation/cubit/debts_bloc.dart' as _i96;
import '../features/home/presentation/bloc/home/home_bloc.dart' as _i71;
import '../features/home/presentation/controller/summary_controller.dart'
    as _i33;
import '../features/home/presentation/cubit/overview/overview_cubit.dart'
    as _i79;
import '../features/home/presentation/cubit/summary/summary_cubit.dart' as _i85;
import '../features/profile/data/repository/profile_repository_impl.dart'
    as _i27;
import '../features/profile/domain/repository/profile_repository.dart' as _i26;
import '../features/profile/domain/use_case/image_picker_use_case.dart' as _i75;
import '../features/profile/domain/use_case/profile_use_case.dart' as _i81;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i80;
import '../features/recurring/data/data_sources/local_recurring_data_manager.dart'
    as _i22;
import '../features/recurring/data/data_sources/local_recurring_data_manager_impl.dart'
    as _i23;
import '../features/recurring/data/model/recurring.dart' as _i9;
import '../features/recurring/data/repository/recurring_repository_impl.dart'
    as _i29;
import '../features/recurring/domain/repository/recurring_repository.dart'
    as _i28;
import '../features/recurring/domain/use_case/add_recurring_use_case.dart'
    as _i42;
import '../features/recurring/domain/use_case/recurring_use_case.dart' as _i83;
import '../features/recurring/presentation/cubit/recurring_cubit.dart' as _i82;
import '../features/search/domain/use_case/filter_expense_use_case.dart'
    as _i84;
import '../features/search/presentation/cubit/search_cubit.dart' as _i98;
import '../features/settings/data/authenticate.dart' as _i5;
import '../features/settings/data/file_handler.dart' as _i60;
import '../features/settings/data/repository/csv_export_impl.dart' as _i59;
import '../features/settings/data/repository/json_export_import_impl.dart'
    as _i58;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i31;
import '../features/settings/domain/repository/import_export.dart' as _i57;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i30;
import '../features/settings/domain/use_case/csv_file_export_use_case.dart'
    as _i94;
import '../features/settings/domain/use_case/json_file_export_use_case.dart'
    as _i77;
import '../features/settings/domain/use_case/json_file_import_use_case.dart'
    as _i78;
import '../features/settings/domain/use_case/setting_use_case.dart' as _i34;
import '../features/settings/domain/use_case/settings_use_case.dart' as _i32;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i99;
import '../features/transaction/data/data_sources/local/transaction_data_manager.dart'
    as _i24;
import '../features/transaction/data/model/transaction_model.dart' as _i10;
import '../features/transaction/data/repository/transaction_repository_impl.dart'
    as _i36;
import '../features/transaction/domain/repository/transaction_repository.dart'
    as _i35;
import '../features/transaction/domain/use_case/add_transaction_use_case.dart'
    as _i43;
import '../features/transaction/domain/use_case/delete_transaction_from_category_id_use_case.dart'
    as _i56;
import '../features/transaction/domain/use_case/delete_transaction_use_case.dart'
    as _i54;
import '../features/transaction/domain/use_case/delete_transactions_by_account_id_use_case.dart'
    as _i55;
import '../features/transaction/domain/use_case/get_transaction_use_case.dart'
    as _i67;
import '../features/transaction/domain/use_case/get_transactions_by_account_id_use_case.dart'
    as _i68;
import '../features/transaction/domain/use_case/get_transactions_by_category_id_use_case.dart'
    as _i69;
import '../features/transaction/domain/use_case/get_transactions_use_case.dart'
    as _i70;
import '../features/transaction/domain/use_case/transaction_use_case.dart'
    as _i72;
import '../features/transaction/domain/use_case/update_expense_use_case.dart'
    as _i37;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i86;
import 'module/hive_module.dart' as _i100;
import 'module/service_module.dart' as _i101;

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
  await gh.singletonAsync<_i6.Box<_i7.DebitModel>>(
    () => hiveBoxModule.debtsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i8.DebitTransactionsModel>>(
    () => hiveBoxModule.transactionsBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i9.RecurringModel>>(
    () => hiveBoxModule.recurringBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i10.TransactionModel>>(
    () => hiveBoxModule.expenseBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i11.CategoryModel>>(
    () => hiveBoxModule.categoryBox,
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic,
    instanceName: 'settings',
    preResolve: true,
  );
  await gh.singletonAsync<_i6.Box<_i12.AccountModel>>(
    () => hiveBoxModule.accountBox,
    preResolve: true,
  );
  gh.singleton<_i13.CountryRepository>(_i14.CountryRepositoryImpl());
  gh.singleton<_i15.DeviceInfoPlugin>(
      serviceBoxModule.providesDeviceInfoPlugin());
  gh.singleton<_i16.EventBus>(serviceBoxModule.providerEventBus());
  gh.factory<_i17.GetCountriesUseCase>(
      () => _i17.GetCountriesUseCase(repository: gh<_i13.CountryRepository>()));
  gh.singleton<_i18.ImagePicker>(serviceBoxModule.providesImagePicker());
  gh.singleton<_i19.InAppReview>(serviceBoxModule.providesInAppReview());
  gh.singleton<_i20.LocalCategoryManager>(
      _i20.LocalCategoryManagerDataSourceImpl(
          gh<_i6.Box<_i11.CategoryModel>>()));
  gh.singleton<_i21.LocalDebitDataSource>(_i21.LocalDebitDataSourceImpl(
    debtBox: gh<_i6.Box<_i7.DebitModel>>(),
    transactionsBox: gh<_i6.Box<_i8.DebitTransactionsModel>>(),
  ));
  gh.factory<_i22.LocalRecurringDataManager>(() =>
      _i23.LocalRecurringDataManagerImpl(gh<_i6.Box<_i9.RecurringModel>>()));
  gh.factory<_i24.LocalTransactionManager>(() =>
      _i24.LocalTransactionManagerImpl(gh<_i25.Box<_i10.TransactionModel>>()));
  gh.singleton<_i26.ProfileRepository>(_i27.ProfileRepositoryImpl(
    gh<_i18.ImagePicker>(),
    gh<_i6.Box<dynamic>>(instanceName: 'settings'),
  ));
  gh.singleton<_i28.RecurringRepository>(_i29.RecurringRepositoryImpl(
    gh<_i22.LocalRecurringDataManager>(),
    gh<_i24.LocalTransactionManager>(),
  ));
  gh.factory<_i30.SettingsRepository>(() => _i31.SettingsRepositoryImpl(
      gh<_i6.Box<dynamic>>(instanceName: 'settings')));
  gh.singleton<_i32.SettingsUseCase>(
      _i32.SettingsUseCase(gh<_i30.SettingsRepository>()));
  gh.singleton<_i33.SummaryController>(
      _i33.SummaryController(gh<_i34.SettingsUseCase>()));
  gh.singleton<_i35.TransactionRepository>(_i36.ExpenseRepositoryImpl(
      dataSource: gh<_i24.LocalTransactionManager>()));
  gh.singleton<_i37.UpdateTransactionUseCase>(_i37.UpdateTransactionUseCase(
      expenseRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i3.AccountManager>(
    _i38.LocalAccountManagerImpl(accountBox: gh<_i6.Box<_i12.AccountModel>>()),
    instanceName: 'local-account',
  );
  gh.singleton<_i39.AccountRepository>(_i40.AccountRepositoryImpl(
      dataSource: gh<_i3.AccountManager>(instanceName: 'local-account')));
  gh.singleton<_i41.AddAccountUseCase>(
      _i41.AddAccountUseCase(accountRepository: gh<_i39.AccountRepository>()));
  gh.singleton<_i42.AddRecurringUseCase>(
      _i42.AddRecurringUseCase(gh<_i28.RecurringRepository>()));
  gh.singleton<_i43.AddTransactionUseCase>(_i43.AddTransactionUseCase(
      expenseRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i44.CategoryRepository>(_i45.CategoryRepositoryImpl(
    dataSources: gh<_i20.LocalCategoryManager>(),
    expenseDataManager: gh<_i24.LocalTransactionManager>(),
  ));
  gh.factory<_i46.CountryPickerCubit>(() => _i46.CountryPickerCubit(
        gh<_i17.GetCountriesUseCase>(),
        gh<_i34.SettingsUseCase>(),
      ));
  gh.singleton<_i47.DebitRepository>(
      _i48.DebtRepositoryImpl(dataSource: gh<_i21.LocalDebitDataSource>()));
  gh.singleton<_i49.DeleteAccountUseCase>(_i49.DeleteAccountUseCase(
      accountRepository: gh<_i39.AccountRepository>()));
  gh.singleton<_i50.DeleteCategoryUseCase>(_i50.DeleteCategoryUseCase(
      categoryRepository: gh<_i44.CategoryRepository>()));
  gh.singleton<_i51.DeleteDebitTransactionUseCase>(
      _i51.DeleteDebitTransactionUseCase(
          debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i52.DeleteDebitTransactionsByDebitIdUseCase>(
      _i52.DeleteDebitTransactionsByDebitIdUseCase(
          debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i53.DeleteDebitUseCase>(
      _i53.DeleteDebitUseCase(debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i54.DeleteTransactionUseCase>(_i54.DeleteTransactionUseCase(
      expenseRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i55.DeleteTransactionsByAccountIdUseCase>(
      _i55.DeleteTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i56.DeleteTransactionsByCategoryIdUseCase>(
      _i56.DeleteTransactionsByCategoryIdUseCase(
          transactionRepository: gh<_i35.TransactionRepository>()));
  gh.lazySingleton<_i57.Export>(
    () => _i58.JSONExportImpl(
      gh<_i3.AccountManager>(instanceName: 'local-account'),
      gh<_i20.LocalCategoryManager>(),
      gh<_i24.LocalTransactionManager>(),
    ),
    instanceName: 'json_export',
  );
  gh.lazySingleton<_i57.Export>(
    () => _i59.CSVExport(
      gh<_i15.DeviceInfoPlugin>(),
      gh<_i3.AccountManager>(instanceName: 'local-account'),
      gh<_i20.LocalCategoryManager>(),
      gh<_i24.LocalTransactionManager>(),
    ),
    instanceName: 'csv',
  );
  gh.singleton<_i60.FileHandler>(_i60.FileHandler(
    gh<_i15.DeviceInfoPlugin>(),
    gh<_i3.AccountManager>(instanceName: 'local-account'),
    gh<_i20.LocalCategoryManager>(),
    gh<_i24.LocalTransactionManager>(),
  ));
  gh.singleton<_i61.GetAccountUseCase>(
      _i61.GetAccountUseCase(accountRepository: gh<_i39.AccountRepository>()));
  gh.singleton<_i62.GetAccountsUseCase>(
      _i62.GetAccountsUseCase(accountRepository: gh<_i39.AccountRepository>()));
  gh.singleton<_i63.GetCategoryUseCase>(_i63.GetCategoryUseCase(
      categoryRepository: gh<_i44.CategoryRepository>()));
  gh.singleton<_i64.GetDebitTransactionsUseCase>(
      _i64.GetDebitTransactionsUseCase(
          debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i65.GetDebitUseCase>(
      _i65.GetDebitUseCase(debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i66.GetDefaultCategoriesUseCase>(
      _i66.GetDefaultCategoriesUseCase(
          categoryRepository: gh<_i44.CategoryRepository>()));
  gh.singleton<_i67.GetTransactionUseCase>(_i67.GetTransactionUseCase(
      transactionRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i68.GetTransactionsByAccountIdUseCase>(
      _i68.GetTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i69.GetTransactionsByCategoryIdUseCase>(
      _i69.GetTransactionsByCategoryIdUseCase(
          expenseRepository: gh<_i35.TransactionRepository>()));
  gh.singleton<_i70.GetTransactionsUseCase>(_i70.GetTransactionsUseCase(
      expenseRepository: gh<_i35.TransactionRepository>()));
  gh.factory<_i71.HomeBloc>(() => _i71.HomeBloc(
        gh<_i72.GetTransactionsUseCase>(),
        gh<_i73.GetDefaultCategoriesUseCase>(),
        gh<_i74.GetAccountUseCase>(),
        gh<_i73.GetCategoryUseCase>(),
        gh<_i72.GetTransactionsByCategoryIdUseCase>(),
      ));
  gh.singleton<_i75.ImagePickerUseCase>(
      _i75.ImagePickerUseCase(gh<_i26.ProfileRepository>()));
  gh.lazySingleton<_i57.Import>(
    () => _i58.JSONImportImpl(
      gh<_i15.DeviceInfoPlugin>(),
      gh<_i3.AccountManager>(instanceName: 'local-account'),
      gh<_i20.LocalCategoryManager>(),
      gh<_i24.LocalTransactionManager>(),
    ),
    instanceName: 'json_import',
  );
  gh.singleton<_i76.InApp>(_i76.InApp(gh<_i19.InAppReview>()));
  gh.singleton<_i77.JSONFileExportUseCase>(_i77.JSONFileExportUseCase(
    gh<_i30.SettingsRepository>(),
    gh<_i57.Export>(instanceName: 'json_export'),
  ));
  gh.singleton<_i78.JSONFileImportUseCase>(_i78.JSONFileImportUseCase(
    gh<_i30.SettingsRepository>(),
    gh<_i57.Import>(instanceName: 'json_import'),
  ));
  gh.factory<_i79.OverviewCubit>(() => _i79.OverviewCubit(
        gh<_i72.GetTransactionsUseCase>(),
        gh<_i73.GetCategoryUseCase>(),
        gh<_i73.GetDefaultCategoriesUseCase>(),
      ));
  gh.factory<_i80.ProfileCubit>(() => _i80.ProfileCubit(
        gh<_i81.ImagePickerUseCase>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.factory<_i82.RecurringCubit>(
      () => _i82.RecurringCubit(gh<_i83.AddRecurringUseCase>()));
  gh.singleton<_i84.SearchUseCase>(
      _i84.SearchUseCase(gh<_i35.TransactionRepository>()));
  gh.factory<_i85.SummaryCubit>(() => _i85.SummaryCubit(
        gh<_i16.EventBus>(),
        gh<_i72.GetTransactionsUseCase>(),
        gh<_i6.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.factory<_i86.TransactionBloc>(() => _i86.TransactionBloc(
        gh<_i32.SettingsUseCase>(),
        getTransactionUseCase: gh<_i72.GetTransactionUseCase>(),
        accountUseCase: gh<_i74.GetAccountUseCase>(),
        addTransactionUseCase: gh<_i72.AddTransactionUseCase>(),
        deleteTransactionUseCase: gh<_i72.DeleteTransactionUseCase>(),
        updateTransactionUseCase: gh<_i72.UpdateTransactionUseCase>(),
        accountsUseCase: gh<_i74.GetAccountsUseCase>(),
        getDefaultCategoriesUseCase: gh<_i73.GetDefaultCategoriesUseCase>(),
      ));
  gh.singleton<_i87.UpdateAccountUseCase>(_i87.UpdateAccountUseCase(
      accountRepository: gh<_i39.AccountRepository>()));
  gh.singleton<_i88.UpdateCategoryUseCase>(_i88.UpdateCategoryUseCase(
      categoryRepository: gh<_i44.CategoryRepository>()));
  gh.singleton<_i89.UpdateDebitUseCase>(
      _i89.UpdateDebitUseCase(debtRepository: gh<_i47.DebitRepository>()));
  gh.factory<_i90.AccountBloc>(() => _i90.AccountBloc(
        gh<_i74.GetAccountUseCase>(),
        gh<_i74.DeleteAccountUseCase>(),
        gh<_i72.GetTransactionsByAccountIdUseCase>(),
        gh<_i74.AddAccountUseCase>(),
        gh<_i63.GetCategoryUseCase>(),
        gh<_i72.DeleteTransactionsByAccountIdUseCase>(),
        gh<_i74.UpdateAccountUseCase>(),
        gh<_i17.GetCountriesUseCase>(),
      ));
  gh.singleton<_i91.AddCategoryUseCase>(_i91.AddCategoryUseCase(
      categoryRepository: gh<_i44.CategoryRepository>()));
  gh.singleton<_i92.AddDebitTransactionUseCase>(_i92.AddDebitTransactionUseCase(
      debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i93.AddDebitUseCase>(
      _i93.AddDebitUseCase(debtRepository: gh<_i47.DebitRepository>()));
  gh.singleton<_i94.CSVFileExportUseCase>(_i94.CSVFileExportUseCase(
    gh<_i30.SettingsRepository>(),
    gh<_i57.Export>(instanceName: 'csv'),
  ));
  gh.factory<_i95.CategoryBloc>(() => _i95.CategoryBloc(
        getCategoryUseCase: gh<_i73.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i73.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i73.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i72.DeleteTransactionsByCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i73.UpdateCategoryUseCase>(),
      ));
  gh.factory<_i96.DebitBloc>(() => _i96.DebitBloc(
        addDebtUseCase: gh<_i97.AddDebitUseCase>(),
        getDebtUseCase: gh<_i97.GetDebitUseCase>(),
        getTransactionsUseCase: gh<_i97.GetDebitTransactionsUseCase>(),
        addTransactionUseCase: gh<_i97.AddDebitTransactionUseCase>(),
        updateDebtUseCase: gh<_i97.UpdateDebitUseCase>(),
        deleteDebtUseCase: gh<_i97.DeleteDebitUseCase>(),
        deleteDebitTransactionUseCase: gh<_i97.DeleteDebitTransactionUseCase>(),
        deleteDebitTransactionsByDebitIdUseCase:
            gh<_i52.DeleteDebitTransactionsByDebitIdUseCase>(),
      ));
  gh.factory<_i98.SearchCubit>(
      () => _i98.SearchCubit(gh<_i84.SearchUseCase>()));
  gh.factory<_i99.SettingCubit>(() => _i99.SettingCubit(
        gh<_i72.GetTransactionsUseCase>(),
        gh<_i73.GetDefaultCategoriesUseCase>(),
        gh<_i72.UpdateTransactionUseCase>(),
        gh<_i34.JSONFileImportUseCase>(),
        gh<_i34.JSONFileExportUseCase>(),
        gh<_i34.SettingsUseCase>(),
        gh<_i34.CSVFileExportUseCase>(),
      ));
  return getIt;
}

class _$HiveBoxModule extends _i100.HiveBoxModule {}

class _$ServiceBoxModule extends _i101.ServiceBoxModule {}
