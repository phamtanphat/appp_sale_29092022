part of 'home_bloc.dart';

enum HomeStatus { init, loading, loaded }

class HomeState {
  final HomeStatus status;
  final String message;
  final List<CardModel> listCard;

  const HomeState({
    this.status = HomeStatus.init,
    this.message = '',
    this.listCard = const [],
  });
  HomeState copyWith({
    HomeStatus? status,
    String? message,
    List<CardModel>? listCard,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      listCard: listCard ?? this.listCard,
    );
  }
}
