import 'package:injectable/injectable.dart';

import '../repository/category_tag_repository.dart';

@singleton
class DeleteCategoryTagUseCase {
  final CategoryTagRepository categoryTagRepository;

  DeleteCategoryTagUseCase({required this.categoryTagRepository});

  Future<void> call(int key) => categoryTagRepository.deleteCategoryTag(key);
}
