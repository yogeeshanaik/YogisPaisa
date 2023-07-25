import 'package:injectable/injectable.dart';
import '../entities/category_tag.dart';
import '../repository/category_tag_repository.dart';
import '../../../core/common.dart';

@singleton
class GetCategoryTagUseCase {
  final CategoryTagRepository categoryTagRepository;

  GetCategoryTagUseCase({required this.categoryTagRepository});

  CategoryTag? call(int categoryTagId) =>
      categoryTagRepository.fetchCategoryTagFromId(categoryTagId)?.toEntity();
}
