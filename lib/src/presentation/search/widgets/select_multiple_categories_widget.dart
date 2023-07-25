import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/src/presentation/expense/bloc/expense_bloc.dart';
import '../../../data/settings/settings.dart';
import '../../../domain/category/entities/category.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../data/category/model/category_model.dart';

class SelectCategories extends StatefulWidget {
  const SelectCategories({Key? key}) : super(key: key);

  @override
  State<SelectCategories> createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  final Settings settings = getIt.get<Settings>();
  int filteredCategoriesCount = 0;
  void refreshSelectedCategoriesCount() {
    setState(() {
      filteredCategoriesCount = (settings.filterCategoryIdList ?? []).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    refreshSelectedCategoriesCount();
    return ValueListenableBuilder<Box<CategoryModel>>(
      valueListenable: getIt.get<Box<CategoryModel>>().listenable(),
      builder: (context, value, child) {
        final List<Category> categories = value.values.toEntities();

        if (categories.isEmpty) {
          return ListTile(
            title: Text(context.loc.addCategoryLabel),
            subtitle: Text(context.loc.noCategoryLabel),
            trailing: const Icon(Icons.keyboard_arrow_right),
          );
        }

        return ScreenTypeLayout(
          tablet: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Badge(
                  label: Text(filteredCategoriesCount.toString()),
                  child: Text(
                    context.loc.selectCategoryLabel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SelectedItem(
                categories: categories,
              )
            ],
          ),
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Badge(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(filteredCategoriesCount.toString()),
                  child: Text(
                    '${context.loc.selectCategoryLabel}    ',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SelectedItem(
                categories: categories,
              )
            ],
          ),
        );
      },
    );
  }
}

class SelectedItem extends StatefulWidget {
  const SelectedItem({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
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
              widget.categories.length,
              (index) {
                final Category category = widget.categories[index];
                bool isSelected =
                    settings.filterCategoryIdList!.contains(category.superId);
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        var categoryIdList = settings.filterCategoryIdList;
                        bool isFiltered =
                            categoryIdList!.contains(category.superId);

                        if (isFiltered) {
                          categoryIdList.remove(category.superId!);
                        } else {
                          categoryIdList.add(category.superId!);
                        }
                        settings.setFilterCategoryIdList(categoryIdList);
                        final _SelectCategoriesState? state = context
                            .findAncestorStateOfType<_SelectCategoriesState>();
                        state?.refreshSelectedCategoriesCount();
                      });
                    },
                    avatar: Icon(
                      color: isSelected
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
                    label: Text(category.name),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                    padding: const EdgeInsets.all(12),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
