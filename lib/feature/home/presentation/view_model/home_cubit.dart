import 'package:elevate_tech_task/core/network/network_result.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';
import 'package:elevate_tech_task/feature/home/data/repo/repository/home_repo.dart';
import 'package:elevate_tech_task/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(GetCategoriesInitial());
  HomeRepo _repo;

  Future<void> getCategory() async {
    emit(GetCategoriesLoading());
    final result = await _repo.getCategories();
    switch (result) {
      case NetworkSuccess<List<CategoryResponseDto>>():
        emit(GetCategoriesSuccess(result.data));
      case NetworkError<List<CategoryResponseDto>>():
        emit(GetCategoriesError(result.message));
    }
  }
}
