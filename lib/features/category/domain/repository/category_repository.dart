import 'package:paisa/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<void> add({
    required String? name,
    required int? icon,
    required int? color,
    required String? desc,
    required double? budget,
    required bool? isBudget,
    required bool? isDefault,
  });

  Future<void> delete(int key);

  CategoryEntity? fetchById(int? categoryId);

  Future<void> update({
    required int? key,
    required String? name,
    required int? icon,
    required int? color,
    required String? desc,
    required double? budget,
    required bool isBudget,
    required bool isDefault,
  });

  Future<void> clear();

  List<CategoryEntity> defaultCategories();

  List<CategoryEntity> categories();
}
