part of 'cart_bloc.dart';

enum CartStatus { init, loading, loaded }

class CartState {
  final CartStatus status;
  final String message;
  final TransactionModel? transaction;

  CartState({
    this.status = CartStatus.init,
    this.message = '',
    this.transaction,
  });

  CartState copyWith({
    CartStatus? status,
    String? message,
    TransactionModel? transaction,
  }) {
    return CartState(
      status: status ?? this.status,
      message: message ?? this.message,
      transaction: transaction ?? this.transaction,
    );
  }
}
