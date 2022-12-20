part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInit extends HomeEvent {}

class OnTapAdd extends HomeEvent {
  final String idProduct;

  OnTapAdd({required this.idProduct});
}
