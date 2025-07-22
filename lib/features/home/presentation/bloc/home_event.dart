part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetProducts extends HomeEvent {
  @override
  List<Object?> get props => [];
}

// class CreateHome extends HomeEvent {
//   final CreateProcutModel home;

//   CreateHome({required this.home});

//   @override
//   List<Object> get props => [home];
// }
