import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/src/presentation/widgets/grayed_out.dart';
import '../../../data/settings/settings.dart';
import '../../../domain/category/entities/category.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../data/category/model/category_model.dart';
import '../bloc/expense_bloc.dart';

class SelectCategoryIcon extends StatelessWidget {
  const SelectCategoryIcon({Key? key, this.showUpdateCategorySwitch})
      : super(key: key);
  final bool? showUpdateCategorySwitch;

  @override
  Widget build(BuildContext context) {
    final Settings settingsController = getIt.get<Settings>();
    bool disableWidget = showUpdateCategorySwitch == null
        ? false
        : !settingsController.settings
            .get(enableCategorySelectionKey, defaultValue: false);
    Widget titleWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: showUpdateCategorySwitch == null
          ? Text(
              context.loc.selectCategoryLabel,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          : SwitchListTile(
              title: Text(
                "Update category?",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              value: settingsController.settings
                  .get(enableCategorySelectionKey, defaultValue: false),
              onChanged: (newValue) {
                settingsController.settings
                    .put(enableCategorySelectionKey, newValue);
              },
            ),
    );

    return ValueListenableBuilder<Box<CategoryModel>>(
      valueListenable: getIt.get<Box<CategoryModel>>().listenable(),
      builder: (context, value, child) {
        final List<Category> categories = value.values.toEntities();

        if (categories.isEmpty) {
          return ListTile(
            onTap: () => context.pushNamed(addCategoryPath),
            title: Text(context.loc.addCategoryLabel),
            subtitle: Text(context.loc.noCategoryLabel),
            trailing: const Icon(Icons.keyboard_arrow_right),
          );
        }

        return ScreenTypeLayout(
          tablet: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget,
              GrayedOut(
                grayedOut: disableWidget,
                child: SelectedItem(
                  categories: categories,
                ),
              )
            ],
          ),
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget,
              GrayedOut(
                grayedOut: disableWidget,
                child: SelectedItem(
                  categories: categories,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    late final expenseBloc = BlocProvider.of<ExpenseBloc>(context);
    final Settings settings = getIt.get<Settings>();
    return BlocBuilder(
      bloc: expenseBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 4.0,
            runSpacing: 8.0,
            children: List.generate(
              categories.length + 1,
              (index) {
                if (index == categories.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      onSelected: (value) => context.pushNamed(addCategoryPath),
                      avatar: Icon(
                        color: Theme.of(context).colorScheme.primary,
                        IconData(
                          MdiIcons.plus.codePoint,
                          fontFamily: 'Material Design Icons',
                          fontPackage: 'material_design_icons_flutter',
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      showCheckmark: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      label: Text(
                        context.loc.addNewLabel,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                      padding: const EdgeInsets.all(12),
                    ),
                  );
                } else {
                  final Category category = categories[index];
                  final selectedCategoryId = (expenseBloc.selectedCategoryId ??
                      settings.defaultCategoryId);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      selected: category.superId == selectedCategoryId,
                      onSelected: (value) =>
                          expenseBloc.add(ChangeCategoryEvent(category)),
                      avatar: Icon(
                        color: category.superId == selectedCategoryId
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        IconData(
                          category.icon,
                          fontFamily: 'Material Design Icons',
                          fontPackage: 'material_design_icons_flutter',
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      showCheckmark: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      label: Text("${category.superId}-${category.name}"),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: category.superId == selectedCategoryId
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                      padding: const EdgeInsets.all(12),
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
