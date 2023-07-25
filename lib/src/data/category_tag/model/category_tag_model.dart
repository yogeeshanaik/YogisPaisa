import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
part 'category_tag_model.g.dart';

@HiveType(typeId: 100)
class CategoryTagModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  String name;

  @HiveField(1)
  int? categoryId;

  @HiveField(2, defaultValue: 0)
  int? superId;

  CategoryTagModel({
    required this.name,
    required this.categoryId,
    this.superId,
  });

  @override
  List<Object?> get props => [name, categoryId];

  factory CategoryTagModel.fromJson(Map<String, dynamic> json) =>
      CategoryTagModel(
        name: json["name"],
        categoryId: json["categoryId"],
      )..superId = json["superId"];

  Map<String, dynamic> toJson() => {
        'name': name,
        'categoryId': categoryId,
        'superId': superId,
      };
}
