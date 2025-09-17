import 'package:elevate_tech_task/core/di/service_locator.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';
import 'package:elevate_tech_task/feature/home/presentation/view/widget/category_item.dart';
import 'package:elevate_tech_task/feature/home/presentation/view_model/home_cubit.dart';
import 'package:elevate_tech_task/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: sl<HomeCubit>()..getCategory(),

        builder: (context, state) {
          switch (state) {
            case GetCategoriesInitial():
            case GetCategoriesLoading():
              return Center(child: CircularProgressIndicator());
            case GetCategoriesSuccess():
              return _buildGetSuccessWidget(state.categories);
            case GetCategoriesError():
              return Text(state.message);
          }
        },
      ),
    );
  }
}

Widget _buildGetSuccessWidget(List<CategoryResponseDto> categories) {
  return GridView.builder(
    itemCount: categories.length,
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      mainAxisExtent: 209,
    ),
    itemBuilder: (context, index) => CategoryItem(category: categories[index]),
  );
}
