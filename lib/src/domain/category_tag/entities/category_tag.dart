import 'package:paisa/src/data/category_tag/model/category_tag_model.dart';

class CategoryTag extends CategoryTagModel {
  CategoryTag({
    required super.name,
    required super.categoryId,
    super.superId,
  });
}
