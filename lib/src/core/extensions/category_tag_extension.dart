import 'package:collection/collection.dart';
import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';
import 'package:paisa/src/domain/category_tag/entities/category_tag.dart';

extension CategoryTagModelHelper on CategoryTagModel {
  CategoryTag toEntity() => CategoryTag(
        name: name,
        categoryId: categoryId,
        superId: superId,
      );
}

extension CategoryTagModelsHelper on Iterable<CategoryTagModel> {
  List<Map<String, dynamic>> toJson() {
    return map((e) => e.toJson()).toList();
  }

  List<CategoryTag> toEntities() =>
      map((categoryTagModel) => categoryTagModel.toEntity())
          .sorted((a, b) => a.name.compareTo(b.name))
          .toList();
}
