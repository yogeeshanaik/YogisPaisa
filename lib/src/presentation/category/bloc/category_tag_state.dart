part of 'category_tag_bloc.dart';

@immutable
abstract class CategoryTagState extends Equatable {
  const CategoryTagState();

  @override
  List<Object?> get props => [];
}

class AddCategoryTagInitial extends CategoryTagState {}

class CategoriesListState extends CategoryTagState {
  final List<CategoryTagModel> categoryTags;

  const CategoriesListState(this.categoryTags);

  @override
  List<Object?> get props => [categoryTags];
}

class CategoryTagAddedState extends CategoryTagState {
  final bool isCategoryTagAddedOrUpdate;

  const CategoryTagAddedState({this.isCategoryTagAddedOrUpdate = false});

  @override
  List<Object?> get props => [isCategoryTagAddedOrUpdate];
}

class CategoryTagDeletedState extends CategoryTagState {}

class CategoryTagErrorState extends CategoryTagState {
  final String errorString;

  const CategoryTagErrorState(this.errorString);
}

class CategoryTagSuccessState extends CategoryTagState {
  final CategoryTagModel categoryTag;

  const CategoryTagSuccessState(this.categoryTag);

  @override
  List<Object?> get props => [categoryTag];
}
