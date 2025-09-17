import 'dart:convert';
import 'package:elevate_tech_task/core/constant/end_points.dart';
import 'package:elevate_tech_task/core/network/network_result.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() async {
    try {
      final url = Uri.https(EndPoint.serverName, EndPoint.productsPath);
      final response = await http.get(url);
      List<dynamic> responseJson = json.decode(response.body);
      List<CategoryResponseDto> listOfCategory = responseJson
          .map(
            (category) =>
                CategoryResponseDto.fromJson(category as Map<String, dynamic>),
          )
          .toList();
      return NetworkSuccess(listOfCategory);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }
}
