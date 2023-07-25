import 'package:injectable/injectable.dart';

import '../repository/category_tag_repository.dart';

@singleton
class AddCategoryTagUseCase {
  final CategoryTagRepository categoryTagRepository;

  AddCategoryTagUseCase({required this.categoryTagRepository});

  Future<void> call({required String name, required int categoryId}) async =>
      categoryTagRepository.addCategoryTag(
        name: name,
        categoryId: categoryId,
      );
}
