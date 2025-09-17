import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';

sealed class HomeState {}

class GetCategoriesInitial extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  final List<CategoryResponseDto> categories;
  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends HomeState {
  final String message;
  GetCategoriesError(this.message);
}

class GetCategoriesLoading extends HomeState {}
