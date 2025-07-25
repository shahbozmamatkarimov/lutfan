import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/home/data/data_sources/home_service.dart';
import 'package:ecommerceapp/features/home/data/repositories/impl_home_repo.dart';
import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:ecommerceapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                print("hILoad");
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadedHomeData) {
                return _buildContent(context, state.products, state.category);
              } else if (state is HomeError) {
                print("hIGO");
                return Center(child: Text(state.error ?? 'Unknown error'));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<ProductEntity> products, List<CategoryEntity> category) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const SpecialOfferCard(),
          // const SizedBox(height: 24),
          BrandGrid(category: category,),
          const SizedBox(height: 24),
          CategoryFilter(category: category,),
          const SizedBox(height: 16),
          ProductGrid(products: products),
        ],
      ),
    );
  }
}