part of 'detail_bloc.dart';

enum DetailStatus { init, loading, loaded }

class DetailState {
  final DetailStatus status;
  final String message;
  final List<TransactionModel> listCart;

  DetailState({
    this.status = DetailStatus.init,
    this.message = '',
    this.listCart = const [],
  });
  DetailState copyWith({
    DetailStatus? status,
    String? message,
    List<TransactionModel>? listCart,
  }) {
    return DetailState(
      status: status ?? this.status,
      message: message ?? this.message,
      listCart: listCart ?? this.listCart,
    );
  }
}
