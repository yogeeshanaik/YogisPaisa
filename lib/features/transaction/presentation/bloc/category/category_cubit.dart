import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paisa/core/use_case/use_case.dart';
import 'package:paisa/features/category/domain/entities/category.dart';
import 'package:paisa/features/category/domain/use_case/category_use_case.dart';

part 'category_cubit.freezed.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.getCategoriesUseCase)
      : super(const CategoryState.initial());

  final GetCategoriesUseCase getCategoriesUseCase;

  void fetchCategory() {
    final List<CategoryEntity> categories = getCategoriesUseCase(NoParams());
    emit(CategoryState.categories(categories));
  }
}

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.categories(List<CategoryEntity> categories) =
      _CategoriesSuccessState;
}
