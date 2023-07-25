import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/category_tag/model/category_tag_model.dart';
import '../../../domain/category_tag/entities/category_tag.dart';
import '../../../domain/category_tag/use_case/add_category_tag_use_case.dart';
import '../../../domain/category_tag/use_case/category_tag_use_case.dart';

part 'category_tag_event.dart';
part 'category_tag_state.dart';

@injectable
class CategoryTagBloc extends Bloc<CategoryTagEvent, CategoryTagState> {
  CategoryTagBloc({
    required this.getCategoryTagUseCase,
    required this.addCategoryTagUseCase,
    required this.deleteCategoryTagUseCase,
    required this.updateCategoryTagUseCase,
  }) : super(AddCategoryTagInitial()) {
    on<FetchCategoryTagFromIdEvent>(_fetchCategoryTagFromId);
    on<CategoryTagEvent>((event, emit) {});
    on<AddOrUpdateCategoryTagEvent>(_addOrUpdateCategoryTag);
    on<CategoryTagDeleteEvent>(_deleteCategoryTag);
  }

  final GetCategoryTagUseCase getCategoryTagUseCase;
  final AddCategoryTagUseCase addCategoryTagUseCase;
  final DeleteCategoryTagUseCase deleteCategoryTagUseCase;
  final UpdateCategoryTagUseCase updateCategoryTagUseCase;

  String? categoryTitle;
  int? categoryId;
  CategoryTag? currentCategoryTag;

  Future<void> _fetchCategoryTagFromId(
    FetchCategoryTagFromIdEvent event,
    Emitter<CategoryTagState> emit,
  ) async {
    final int? categoryTagId = int.tryParse(event.categoryTagId ?? '');
    if (categoryTagId == null) return;

    final CategoryTag? category = getCategoryTagUseCase(categoryTagId);
    if (category != null) {
      categoryTitle = category.name;
      currentCategoryTag = category;
      emit(CategoryTagSuccessState(category));
    }
  }

  FutureOr<void> _addOrUpdateCategoryTag(
    AddOrUpdateCategoryTagEvent event,
    Emitter<CategoryTagState> emit,
  ) async {
    final String? title = categoryTitle;
    final int? _categoryId = categoryId;

    if (event.isAddOrUpdate) {
      await addCategoryTagUseCase(
        name: title!,
        categoryId: _categoryId!,
      );
    } else {
      if (currentCategoryTag == null) return;

      currentCategoryTag!..name = title!;

      await updateCategoryTagUseCase(currentCategoryTag!);
    }
    emit(
        CategoryTagAddedState(isCategoryTagAddedOrUpdate: event.isAddOrUpdate));
  }

  Future<void> _deleteCategoryTag(
    CategoryTagDeleteEvent event,
    Emitter<CategoryTagState> emit,
  ) async {
    await deleteCategoryTagUseCase(event.categoryTag.superId!);
    emit(CategoryTagDeletedState());
  }
}
