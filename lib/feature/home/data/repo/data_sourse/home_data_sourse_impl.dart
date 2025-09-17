import 'package:elevate_tech_task/core/network/network_result.dart';
import 'package:elevate_tech_task/feature/home/data/api/home_api.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';
import 'package:elevate_tech_task/feature/home/data/repo/data_sourse/home_data_sourse.dart';

class HomeDataSourseImpl implements HomeDataSourse {
  final HomeApi _homeApi;
  HomeDataSourseImpl(this._homeApi);

  @override
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() =>
      _homeApi.getCategories();
}
