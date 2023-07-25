import 'package:injectable/injectable.dart';
import 'package:paisa/src/domain/category_tag/repository/category_tag_repository.dart';

import '../data_sources/category_tag_local_data_source.dart';
import '../model/category_tag_model.dart';

@Singleton(as: CategoryTagRepository)
class CategoryTagRepositoryImpl extends CategoryTagRepository {
  final LocalCategoryTagManagerDataSource dataSources;

  CategoryTagRepositoryImpl({required this.dataSources});

  @override
  Future<void> deleteCategoryTag(int key) => dataSources.deleteCategoryTag(key);

  @override
  Future<void> addCategoryTag({
    required String name,
    required int categoryId,
  }) =>
      dataSources.addCategoryTag(CategoryTagModel(
        name: name,
        categoryId: categoryId,
      ));

  @override
  CategoryTagModel? fetchCategoryTagFromId(int categoryTagId) =>
      dataSources.fetchCategoryTagFromId(categoryTagId);

  @override
  Future<void> updateCategoryTag({
    required int key,
    required String name,
    required int categoryId,
  }) {
    return dataSources.updateCategoryTag(CategoryTagModel(
      name: name,
      categoryId: categoryId,
      superId: key,
    ));
  }

  @override
  Future<void> clearAll() => dataSources.clearAll();
}
