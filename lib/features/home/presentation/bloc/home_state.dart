// ignore_for_file: non_constant_identifier_names

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedHomeData extends HomeState {
  final List<ProductEntity> products;
  final List<CategoryEntity> category;
  final StateStatus status;
  final String? error;
  final int tabIndex;
  const LoadedHomeData({
    required this.products,
    required this.category,
    this.error,
    this.status = StateStatus.normal,
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [products, category, status, tabIndex];
}

class SuccessUpdate extends HomeState {
  @override
  List<Object> get props => [];
}

class Error extends HomeState {
  final String? error;

  const Error({this.error});
  @override
  List<Object> get props => [];
}

class ErrorLoadingHomeData extends HomeState {
  final String errorMessage;

  ErrorLoadingHomeData(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class HomeLoaded extends HomeState {
  final List<ProductEntity> products;
  final List<CategoryEntity> category;

  HomeLoaded({required this.products, required this.category});

  @override
  List<Object?> get props => [products, category]; // 🟢 SHU QATORNI QO‘SHING
}

class HomeError extends HomeState {
  final String? error;

  const HomeError({this.error});

  @override
  List<Object?> get props => [error];
}