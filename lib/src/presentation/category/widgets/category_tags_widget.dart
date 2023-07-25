import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';
import 'package:paisa/src/domain/category_tag/entities/category_tag.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';

class CategoryTagsWidget extends StatelessWidget {
  const CategoryTagsWidget({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<CategoryTagModel>>(
      valueListenable: getIt.get<Box<CategoryTagModel>>().listenable(),
      builder: (context, value, child) {
        final List<CategoryTag> categoryTags = value.values
            .where((element) => element.categoryId == categoryId)
            .toEntities();

        // if (categoryTags.isEmpty) {
        //   return ListTile(
        //     onTap: () => context.pushNamed(addCategoryTagPath,
        //         params: {'cid': categoryId.toString()}),
        //     title: Text(context.loc.addCategoryLabel),
        //     subtitle: Text(context.loc.noCategoryLabel),
        //     trailing: const Icon(Icons.keyboard_arrow_right),
        //   );
        // }

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
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  context.loc.categoryTagLabel,
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
          categoryTags.length + 1,
          (index) {
            if (index == categoryTags.length) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  onSelected: (value) => context.pushNamed(addCategoryTagPath,
                      params: {'cid': categoryId.toString()}),
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
                  labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  padding: const EdgeInsets.all(12),
                ),
              );
            } else {
              final CategoryTag categoryTag = categoryTags[index];
              final selectedCategoryId = 0;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  // selected: categoryTag.superId == selectedCategoryId,
                  onSelected: (value) =>
                      //     expenseBloc.add(ChangeCategoryEvent(category)),

                      //onTap: () =>
                      context.pushNamed(
                    editCategoryTagPath,
                    params: <String, String>{
                      'cid': categoryTag.categoryId.toString(),
                      'id': categoryTag.superId.toString(),
                    },
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
                  label: Text(categoryTag.name),
                  labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: categoryTag.superId == selectedCategoryId
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant),
                  padding: const EdgeInsets.all(12),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
