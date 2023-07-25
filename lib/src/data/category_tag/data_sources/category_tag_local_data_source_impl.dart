import 'package:collection/collection.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import '../model/category_tag_model.dart';
import 'category_tag_local_data_source.dart';

@Singleton(as: LocalCategoryTagManagerDataSource)
class LocalCategoryTagManagerDataSourceImpl
    implements LocalCategoryTagManagerDataSource {
  final Box<CategoryTagModel> categoryTagsBox;

  LocalCategoryTagManagerDataSourceImpl(this.categoryTagsBox);

  @override
  Future<void> addCategoryTag(CategoryTagModel categoryTag) async {
    final int id = await categoryTagsBox.add(categoryTag);
    categoryTag.superId = id;
    await categoryTag.save();
  }

  @override
  Future<void> deleteCategoryTag(int key) async {
    await categoryTagsBox.delete(key);
  }

  @override
  Future<List<CategoryTagModel>> categoryTags() async {
    return categoryTagsBox.values.toList();
  }

  @override
  CategoryTagModel? fetchCategoryTagFromId(int categoryId) =>
      categoryTagsBox.values.firstWhereOrNull(
        (element) => element.superId == categoryId,
      );

  @override
  Iterable<CategoryTagModel> exportData() => categoryTagsBox.values;

  @override
  Future<void> updateCategoryTag(CategoryTagModel categoryModel) {
    return categoryTagsBox.put(categoryModel.superId!, categoryModel);
  }

  @override
  Future<void> clearAll() => categoryTagsBox.clear();
}
