import '../model/category_tag_model.dart';

abstract class LocalCategoryTagManagerDataSource {
  Future<void> addCategoryTag(CategoryTagModel categoryTag);
  Future<void> deleteCategoryTag(int key);
  Future<List<CategoryTagModel>> categoryTags();
  CategoryTagModel? fetchCategoryTagFromId(int categoryId);
  Iterable<CategoryTagModel> exportData();
  Future<void> updateCategoryTag(CategoryTagModel categoryTagsModel);
  Future<void> clearAll();
}
