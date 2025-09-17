import 'package:elevate_tech_task/core/network/network_result.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';

abstract class HomeDataSourse {
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories();
}
