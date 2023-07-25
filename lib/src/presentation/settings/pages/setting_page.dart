import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/src/data/accounts/model/account_model.dart';
import 'package:paisa/src/data/category/model/category_model.dart';
import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';
import 'package:paisa/src/data/expense/model/expense_model.dart';
import 'package:paisa/src/data/settings/settings.dart';
import 'package:paisa/src/presentation/widgets/paisa_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../core/enum/box_types.dart';
import '../../../core/enum/theme_mode.dart';
import '../../../data/settings/authenticate.dart';
import '../../widgets/choose_theme_mode_widget.dart';
import '../widgets/biometrics_auth_widget.dart';
import '../widgets/currency_change_widget.dart';
import '../widgets/setting_option.dart';
import '../widgets/settings_color_picker_widget.dart';
import '../widgets/settings_group_card.dart';
import '../widgets/version_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = getIt.get<Box<dynamic>>(
      instanceName: BoxType.settings.name,
    );
    final currentTheme = ThemeMode.values[getIt
        .get<Box<dynamic>>(instanceName: BoxType.settings.name)
        .get(themeModeKey, defaultValue: 0)];
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(context.loc.settingsLabel),
          ),
          SliverFillRemaining(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SettingsGroup(
                  title: context.loc.colorsLabel,
                  options: [
                    SettingsColorPickerWidget(settings: settings),
                    SettingsOption(
                      title: context.loc.chooseThemeLabel,
                      subtitle: currentTheme.themeName,
                      onTap: () {
                        showModalBottomSheet(
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
                          context: context,
                          builder: (_) => ChooseThemeModeWidget(
                            currentTheme: currentTheme,
                          ),
                        );
                      },
                    )
                  ],
                ),
                SettingsGroup(
                  title: context.loc.othersLabel,
                  options: [
                    const CurrencyChangeWidget(),
                    const Divider(),
                    BiometricAuthWidget(
                      authenticate: getIt.get<Authenticate>(),
                    ),
                    SettingsOption(
                      title: context.loc.backupAndRestoreLabel,
                      subtitle: context.loc.backupAndRestoreDescLabel,
                      onTap: () {
                        GoRouter.of(context).goNamed(exportAndImport);
                      },
                    ),
                    SettingsOption(
                      title: "File upload",
                      subtitle:
                          "Upload transaction exported from banks (csv file)",
                      onTap: () {
                        GoRouter.of(context).goNamed(fileUpload);
                      },
                    ),
                    SettingsOption(
                      title: "Clear data",
                      subtitle: "Clears all expenses, categories and accounts.",
                      onTap: () {
                        paisaAlertDialog(
                          context,
                          title: Text(context.loc.dialogDeleteTitleLabel),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: context.loc.deleteExpenseLabel,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              const ClearDataOptionsWidget(),
                            ],
                          ),
                          confirmationButton: TextButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            onPressed: () {
                              final Settings settings = getIt.get<Settings>();

                              if (settings.clearExpensesEnabled ?? false) {
                                final expenseBox = Hive.box<ExpenseModel>(
                                    BoxType.expense.name);
                                expenseBox.clear();
                              }

                              if (settings.clearAccountsEnabled ?? false) {
                                final accountBox = Hive.box<AccountModel>(
                                    BoxType.accounts.name);
                                accountBox.clear();
                              }

                              if (settings.clearCategoriesEnabled ?? false) {
                                final categoryBox = Hive.box<CategoryModel>(
                                    BoxType.category.name);
                                categoryBox.clear();
                              }

                              if (settings.clearCategoryTagsEnabled ?? false) {
                                final categoryTagBox =
                                    Hive.box<CategoryTagModel>(
                                        BoxType.categoryTag.name);
                                categoryTagBox.clear();
                              }

                              Navigator.pop(context);
                            },
                            child: Text(context.loc.deleteLabel),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SettingsGroup(
                  title: context.loc.socialLinksLabel,
                  options: [
                    SettingsOption(
                      title: context.loc.appRateLabel,
                      subtitle: context.loc.appRateDescLabel,
                      onTap: () => launchUrl(
                        Uri.parse(playStoreUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),
                    const Divider(),
                    SettingsOption(
                      title: context.loc.githubLabel,
                      subtitle: context.loc.githubTextLabel,
                      onTap: () => launchUrl(
                        Uri.parse(gitHubUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),
                    const Divider(),
                    SettingsOption(
                      title: context.loc.telegramLabel,
                      subtitle: context.loc.telegramGroupLabel,
                      onTap: () => launchUrl(
                        Uri.parse(telegramGroupUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),
                    const Divider(),
                    SettingsOption(
                      title: context.loc.privacyPolicyLabel,
                      onTap: () => launchUrl(
                        Uri.parse(termsAndConditionsUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),
                    const Divider(),
                    const VersionWidget(),
                  ],
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(context.loc.madeWithLoveInIndiaLabel),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ClearDataOptionsWidget extends StatefulWidget {
  const ClearDataOptionsWidget({super.key});
  @override
  State<ClearDataOptionsWidget> createState() => _ClearDataOptionsWidgetState();
}

class _ClearDataOptionsWidgetState extends State<ClearDataOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    final Settings settings = getIt.get<Settings>();
    return Column(children: [
      SwitchListTile(
        title: const Text("Expenses"),
        onChanged: (value) {
          setState(() {
            settings.setClearExpensesEnabled(value);
          });
        },
        value: (settings.clearExpensesEnabled ?? false),
      ),
      SwitchListTile(
        title: const Text("Accounts"),
        onChanged: (value) {
          setState(() {
            settings.setClearAccountsEnabled(value);
          });
        },
        value: (settings.clearAccountsEnabled ?? false),
      ),
      SwitchListTile(
        title: const Text("Categories"),
        onChanged: (value) {
          setState(() {
            settings.setClearCategoriesEnabled(value);
          });
        },
        value: (settings.clearCategoriesEnabled ?? false),
      ),
      SwitchListTile(
        title: const Text("Category Tags"),
        onChanged: (value) {
          setState(() {
            settings.setClearCategoryTagsEnabled(value);
          });
        },
        value: (settings.clearCategoryTagsEnabled ?? false),
      ),
    ]);
  }
}
