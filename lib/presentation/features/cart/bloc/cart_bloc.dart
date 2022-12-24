import 'package:appp_sale_29092022/data/datasources/api_request.dart';
import 'package:appp_sale_29092022/data/model/add_cart_response.dart';
import 'package:appp_sale_29092022/data/model/order_history_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<OnTapOrderCart>((event, emit) async {
      emit(
        state.copyWith(status: CartStatus.loading),
      );
      try {
        var response =
            await ApiRequest().cartConform(idTransaction: event.idTransaction);
        if (response != null && response.data != null) {
          var transaction = state.transaction;
          emit(
            state.copyWith(
              status: CartStatus.loaded,
              transaction: transaction?.copyWith(products: []),
            ),
          );
        }
      } catch (e) {
        debugPrint('$e');
      }
    });

    on<OnTapChangedQuantity>((event, emit) async {
      emit(
        state.copyWith(status: CartStatus.loading),
      );
      try {
        debugPrint('idTran: ${event.idTransaction}');
        debugPrint('idProduct: ${event.idProduct}');
        debugPrint('idTran: ${event.quantity}');
        var response = await ApiRequest().updateCart(
          idTransaction: event.idTransaction,
          idProduct: event.idProduct,
          quantity: event.quantity,
        );
        if (response != null && response.data != null) {
          var cartResponse = AddCartResponse.fromJson(response.data!);
          emit(
            state.copyWith(
              status: CartStatus.loaded,
              transaction: cartResponse.data,
            ),
          );
        }
      } catch (e) {
        debugPrint('$e');
      }
    });

    on<CartInit>((event, emit) async {
      emit(
        state.copyWith(status: CartStatus.loading),
      );
      try {
        var response = await ApiRequest().getCart();
        if (response != null && response.data != null) {
          var cartResponse = AddCartResponse.fromJson(response.data!);
          emit(
            state.copyWith(
              status: CartStatus.loaded,
              transaction: cartResponse.data,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: CartStatus.loaded,
              transaction: TransactionModel(products: []),
            ),
          );
        }
      } catch (e) {
        debugPrint('$e');
      }
    });
  }
}
