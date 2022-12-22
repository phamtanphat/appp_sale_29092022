part of 'history_bloc.dart';

enum HistoryStatus { init, loading, loaded }

class HistoryState {
  final HistoryStatus status;
  final String message;
  final List<TransactionModel> listCart;

  HistoryState({
    this.status = HistoryStatus.init,
    this.message = '',
    this.listCart = const [],
  });
  HistoryState copyWith({
    HistoryStatus? status,
    String? message,
    List<TransactionModel>? listCart,
  }) {
    return HistoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      listCart: listCart ?? this.listCart,
    );
  }
}
