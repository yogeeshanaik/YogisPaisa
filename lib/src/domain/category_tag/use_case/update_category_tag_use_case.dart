import 'package:injectable/injectable.dart';

import '../entities/category_tag.dart';
import '../repository/category_tag_repository.dart';

@singleton
class UpdateCategoryTagUseCase {
  final CategoryTagRepository categoryTagRepository;

  UpdateCategoryTagUseCase({required this.categoryTagRepository});

  Future<void> call(CategoryTag categoryTag) async =>
      categoryTagRepository.updateCategoryTag(
        key: categoryTag.superId!,
        name: categoryTag.name,
        categoryId: categoryTag.categoryId!,
      );
}
