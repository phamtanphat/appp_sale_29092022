import 'dart:developer';

import 'package:appp_sale_29092022/data/datasources/api_request.dart';
import 'package:appp_sale_29092022/data/model/card_response.dart';
import 'package:appp_sale_29092022/data/model/order_history_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState()) {
    on<HistoryInit>((event, emit) async {
      emit(
        state.copyWith(status: HistoryStatus.loading),
      );
      try {
        final response = await ApiRequest().orderHisory();
        if (response != null && response.data != null) {
          var cartResponse = OrderHistoryResponse.fromJson(response.data!);
          emit(state.copyWith(
            listCart: cartResponse.data,
            status: HistoryStatus.loaded,
          ));
        }
      } catch (e) {
        debugPrint('$e');
      }
    });
  }
}
