import 'package:dio/dio.dart';
import 'package:lutfan/core/resources/app_colors.dart';
import 'package:lutfan/features/home/data/data_sources/home_service.dart';
import 'package:lutfan/features/home/data/repositories/impl_home_repo.dart';
import 'package:lutfan/features/home/domain/entities/category_entity.dart';
import 'package:lutfan/features/home/domain/entities/home_entity.dart';
import 'package:lutfan/features/home/presentation/bloc/home_bloc.dart';
import 'package:lutfan/features/home/presentation/widgets/productLoading.dart';
import 'package:lutfan/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../widgets/brand_grid.dart';
import '../../../../widgets/product_grid.dart';
import '../../../../widgets/category_filter.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) {
        final homeRepo = ImplProductRepo(
          productService: HomeService(Dio()),
        );
        return HomeBloc(homeRepo: homeRepo)..add(GetProducts());
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(
                                0.3), // Background color of the skeleton
                            highlightColor: Colors.grey.withOpacity(
                                0.1), // Highlight color of the skeleton
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width - 94,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(
                                0.3), // Background color of the skeleton
                            highlightColor: Colors.grey.withOpacity(
                                0.1), // Highlight color of the skeleton
                            child: Container(
                              height: 50,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.59,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) => buildShimmerCard(),
                      ),
                    ],
                  ),
                );
                // return const Center(child: CircularProgressIndicator());
                // return Shimmer.fromColors(
                //   baseColor: Colors.grey
                //       .withOpacity(0.3), // Background color of the skeleton
                //   highlightColor: Colors.grey
                //       .withOpacity(0.1), // Highlight color of the skeleton
                //   child: Container(
                //     height: 270,
                //     width: 164,
                //     decoration: BoxDecoration(
                //       color: Colors.grey[300],
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //   ),
                // );
              } else if (state is LoadedHomeData) {
                return _buildContent(context, state.products, state.category);
              } else if (state is HomeError) {
                return Center(child: Text(state.error ?? 'Unknown error'));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<ProductEntity> products,
      List<CategoryEntity> category) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const SpecialOfferCard(),
          // const SizedBox(height: 24),
          // BrandGrid(category: category,),
          // CategoryFilter(category: category,),
          const SizedBox(height: 24),
          Filter(category: category),
          const SizedBox(height: 18),
          ProductGrid(products: products),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
