import 'package:elevate_tech_task/core/di/service_locator.dart';
import 'package:elevate_tech_task/feature/home/data/model/category_response_dto.dart';
import 'package:elevate_tech_task/feature/home/presentation/view/widget/category_item.dart';
import 'package:elevate_tech_task/feature/home/presentation/view_model/home_cubit.dart';
import 'package:elevate_tech_task/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              return _buildGetCategoryLoadingWidget();
            case GetCategoriesSuccess():
              return _buildGetSuccessWidget(state.categories);
            case GetCategoriesError():
              return Text(state.message);
          }
        },
      ),
    );
  }

  Widget _buildGetCategoryLoadingWidget() {
    final category = CategoryResponseDto(
      id: 1,
      title: "Wireless Headphones",
      price: 5999.99,
      description: "High-quality wireless headphones with noise cancellation.",
      category: "Electronics",
      image: "https://example.com/images/headphones.jpg",
      rating: Rating(rate: 4.5, count: 120),
    );
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          mainAxisExtent: 209,
        ),
        itemBuilder: (context, index) => CategoryItem(category: category),
      ),
    );
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
      itemBuilder: (context, index) =>
          CategoryItem(category: categories[index]),
    );
  }
}
