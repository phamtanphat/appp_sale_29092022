part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class OnTapOrderCart extends CartEvent {
  final String idTransaction;

  OnTapOrderCart({required this.idTransaction});
}

class OnTapChangedQuantity extends CartEvent {
  final String idTransaction;
  final String idProduct;
  final int quantity;

  OnTapChangedQuantity({
    required this.idTransaction,
    required this.idProduct,
    required this.quantity,
  });
}

class CartInit extends CartEvent {}
