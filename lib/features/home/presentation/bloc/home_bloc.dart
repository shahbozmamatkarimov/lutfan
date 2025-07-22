import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/core/resources/state_status.dart';
import 'package:ecommerceapp/features/home/data/models/home.dart';
import 'package:ecommerceapp/features/home/domain/entities/category_entity.dart';
import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:ecommerceapp/features/home/domain/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepo homeRepo;
  int activeTabIndex = 0;
  late List<Product> home;

  HomeBloc({
    required this.homeRepo,
  }) : super(HomeInitial()) {
    on<GetProducts>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await homeRepo.getProducts();
        if (response is DataSuccess) {
          // home = response.data;
          Map<String, dynamic>? homeDto = response.data;
          if (homeDto != null) {
            emit(LoadedHomeData(
              products: homeDto['products'],
              category: homeDto['category'],
              status: StateStatus.loaded,
            ));
          } else {
            emit(ErrorLoadingHomeData("Failed to load home data"));
          }
        }
      } catch (e) {
        print("==$e");
        final errorMessage = 'Failed to load home data: $e';
        emit(ErrorLoadingHomeData(errorMessage));
      }
    });

    // on<CreateHome>((event, emit) async {
    //   emit(HomeLoading());
    //   try {
    //     final response = await homeRepo.createPr(event.home);
    //     if (response is DataSuccess) {
    //       // home = response.data;
    //       ProductDto? homeDto = response.data;
    //       if (homeDto != null) {
    //         emit(LoadedHomeData(
    //           products: homeDto.products,
    //           my_products: homeDto.my_products,
    //           status: StateStatus.loaded,
    //         ));
    //       } else {
    //         emit(ErrorLoadingHomeData("Failed to load home data"));
    //       }
    //     }
    //   } catch (e) {
    //     print("==$e");
    //     final errorMessage = 'Failed to load home data: $e';
    //     emit(ErrorLoadingHomeData(errorMessage));
    //   }
    // });

    add(GetProducts());
  }
}
