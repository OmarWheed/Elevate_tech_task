import 'package:elevate_tech_task/core/network/network_result.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';
import 'package:elevate_tech_task/feature/home/data/repo/data_sourse/home_data_sourse.dart';
import 'package:elevate_tech_task/feature/home/data/repo/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSourse _homeDataSourse;
  HomeRepoImpl(this._homeDataSourse);
  @override
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() =>
      _homeDataSourse.getCategories();
}
