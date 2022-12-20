import 'package:appp_sale_29092022/data/datasources/api_request.dart';
import 'package:appp_sale_29092022/data/model/card_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInit>((event, emit) async {
      try {
        final response = await ApiRequest().getProducts();
        if (response != null && response.data != null) {
          var userResponse = CardResponse.fromJson(response.data);
          emit(
            state.copyWith(listCard: userResponse.data),
          );
        } else {}
      } catch (e) {
        debugPrint('$e');
      }
    });
    on<OnTapAdd>((event, emit) async {
      emit(
        state.copyWith(status: HomeStatus.loading),
      );
      try {
        final response = await ApiRequest().addCart(idProduct: event.idProduct);
        if (response != null && response.data != null) {
          emit(state.copyWith(status: HomeStatus.loaded));
        }
      } catch (e) {
        debugPrint('$e');
      }
    });
  }
}
