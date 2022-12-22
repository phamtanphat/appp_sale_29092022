import 'package:appp_sale_29092022/data/datasources/api_request.dart';
import 'package:appp_sale_29092022/data/model/order_history_response.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState()) {
    on<DetailInit>((event, emit) async {
      emit(
        state.copyWith(status: DetailStatus.loading),
      );
      try {
        final response = await ApiRequest().orderHisory();
        if (response != null && response.data != null) {
          var cartResponse = OrderHistoryResponse.fromJson(response.data!);
          emit(state.copyWith(
            listCart: cartResponse.data,
            status: DetailStatus.loaded,
          ));
        }
      } catch (e) {
        debugPrint('$e');
      }
    });
  }
}
