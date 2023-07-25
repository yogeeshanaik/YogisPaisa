import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';

abstract class CategoryTagRepository {
  Future<void> addCategoryTag({
    required String name,
    required int categoryId,
  });
  Future<void> deleteCategoryTag(int key);
  CategoryTagModel? fetchCategoryTagFromId(int categoryTagId);
  Future<void> updateCategoryTag({
    required int key,
    required String name,
    required int categoryId,
  });
  Future<void> clearAll();
}
