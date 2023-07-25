import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/src/core/theme/custom_color.dart';
import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';
import 'package:paisa/src/data/expense/model/expense_model.dart';
import 'package:paisa/src/domain/category_tag/entities/category_tag.dart';
import 'package:paisa/src/domain/expense/entities/expense.dart';
import 'package:paisa/src/presentation/category/bloc/category_tag_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';

class TagSuggestionWidget extends StatelessWidget {
  const TagSuggestionWidget({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<CategoryTagModel>>(
      valueListenable: getIt.get<Box<CategoryTagModel>>().listenable(),
      builder: (context, value, child) {
//Suggestion list:
// Expenses keyword not in tags list
// Keep unique words
// Remove words in tags list

        List<CategoryTag> categoryTags = value.values
            .where((element) => element.categoryId == categoryId)
            .toEntities();

        final List<Expense> expenses = getIt
            .get<Box<ExpenseModel>>()
            .values
            .where((element) =>
                element.categoryId ==
                categoryId) // expenses only from current category
            .toEntities();
        var keywords = expenses
            .map((e) => ("${e.name}+${e.description!}".split('+')))
            .expand((i) => i) //flatten list
            .toSet(); //remove duplicates

// remove empty string
        keywords.removeWhere((element) => [''].contains(element));

// exclude existing tags
        var filteredList = List.from(keywords.where((value) {
          return !(categoryTags
              .where((element) => value.contains(element.name))
              .isNotEmpty);
        }));

        categoryTags = filteredList.map((e) {
          return CategoryTag(name: e, categoryId: categoryId);
        }).toList();

        return ScreenTypeLayout(
            tablet: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    context.loc.selectCategoryLabel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                TagItems(
                  categoryTags: categoryTags,
                  categoryId: categoryId,
                )
              ],
            ),
            mobile: ExpansionTile(
                // backgroundColor: Colors.white,
                title: ExpenseTitleWidget(
                    title: "TAG SUGGESTIONS", total: categoryTags.length),
                controlAffinity: ListTileControlAffinity.platform,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TagItems(
                        categoryTags: categoryTags,
                        categoryId: categoryId,
                      ),
                    ],
                  )
                ])

            /*
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Suggested tags: click to add",
                  //context.loc.categoryTagLabel,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              TagItems(
                categoryTags: categoryTags,
                categoryId: categoryId,
              )
            ],
          ),
          */
            );
      },
    );
  }
}

class TagItems extends StatelessWidget {
  const TagItems({
    super.key,
    required this.categoryId,
    required this.categoryTags,
  });
  final int categoryId;
  final List<CategoryTag> categoryTags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 4.0,
        runSpacing: 8.0,
        children: List.generate(
          categoryTags.length,
          (index) {
            final CategoryTag categoryTag = categoryTags[index];
            final selectedCategoryId = 0;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                // selected: categoryTag.superId == selectedCategoryId,
                onSelected: (value) => {
                  BlocProvider.of<CategoryTagBloc>(context)
                      .addCategoryTagUseCase(
                    name: categoryTag.name,
                    categoryId: categoryId,
                  )
                },

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                  side: BorderSide(
                    width: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                showCheckmark: false,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(categoryTag.name),
                labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: categoryTag.superId == selectedCategoryId
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant),
                padding: const EdgeInsets.all(12),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExpenseTitleWidget extends StatelessWidget {
  const ExpenseTitleWidget({
    Key? key,
    required this.title,
    required this.total,
  }) : super(key: key);

  final String title;
  final int total;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.outfit(
          fontWeight: FontWeight.w600,
          textStyle: Theme.of(context).textTheme.titleMedium,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      trailing: Text(
        total.toString(),
        style: GoogleFonts.manrope(
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: total.isNegative
                    ? Theme.of(context).extension<CustomColors>()!.red
                    : Theme.of(context).extension<CustomColors>()!.green,
              ),
        ),
      ),
    );
  }
}
