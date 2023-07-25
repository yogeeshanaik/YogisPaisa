part of 'category_tag_bloc.dart';

@immutable
abstract class CategoryTagEvent extends Equatable {
  const CategoryTagEvent();

  @override
  List<Object?> get props => [];
}

class AddOrUpdateCategoryTagEvent extends CategoryTagEvent {
  final bool isAddOrUpdate;

  const AddOrUpdateCategoryTagEvent(this.isAddOrUpdate);
  @override
  List<Object?> get props => [isAddOrUpdate];
}

class CategoryTagDeleteEvent extends CategoryTagEvent {
  final CategoryTag categoryTag;

  const CategoryTagDeleteEvent(this.categoryTag);

  @override
  List<Object?> get props => [categoryTag];
}

class FetchCategoryTagFromIdEvent extends CategoryTagEvent {
  final String? categoryTagId;

  const FetchCategoryTagFromIdEvent(this.categoryTagId);

  @override
  List<Object?> get props => [categoryTagId];

  FetchCategoryTagFromIdEvent copyWith({
    String? categoryTagId,
  }) =>
      FetchCategoryTagFromIdEvent(categoryTagId ?? this.categoryTagId);
}

