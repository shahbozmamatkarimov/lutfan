import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/home/data/data_sources/home_service.dart';
import 'package:ecommerceapp/features/home/data/repositories/impl_home_repo.dart';
import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:ecommerceapp/features/home/domain/repositories/home_repo.dart';
import 'package:ecommerceapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/brand_grid.dart';
import '../../../../widgets/product_grid.dart';
import '../../../../widgets/special_offer_card.dart';
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
          const SpecialOfferCard(),
          const SizedBox(height: 24),
          const BrandGrid(),
          const SizedBox(height: 24),
          CategoryFilter(category: category,),
          const SizedBox(height: 16),
          ProductGrid(products: products),
        ],
      ),
    );
  }
}


// @RoutePage()
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Search Bar
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Search',
//                             border: InputBorder.none,
//                             hintStyle: TextStyle(color: Colors.grey[400]),
//                           ),
//                         ),
//                       ),
//                       Icon(Icons.tune, color: Colors.grey[600]),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Special Offers
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       'Special Offers',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'See All',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const SpecialOfferCard(),
//                 const SizedBox(height: 24),

//                 // Brand Grid
//                 const BrandGrid(),
//                 const SizedBox(height: 24),

//                 // Most Popular
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       'Most Popular',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'See All',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const CategoryFilter(),
//                 const SizedBox(height: 16),
//                 // const ProductGrid(),
//                 BlocBuilder<HomeBloc, HomeState>(
//                   builder: (context, state) {
//                     if (state is HomeLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is HomeLoaded) {
//                       return ProductGrid(products: state.products);
//                     } else if (state is HomeError) {
//                       return Center(
//                           child: Text(state.error ?? 'Unknown error'));
//                     } else {
//                       return const SizedBox.shrink();
//                     }
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
