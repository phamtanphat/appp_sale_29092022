import 'package:appp_sale_29092022/data/datasources/api_request.dart';
import 'package:appp_sale_29092022/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInInit>((event, emit) async {});

    on<OnTapButtonLogin>((event, emit) async {
      emit(state.copyWith(status: SignInStatus.loading));
      var response = await ApiRequest()
          .signIn(email: event.email, password: event.password);
      if (response != null && response.data != null) {
        var userResponse = UserResponse.fromJson(response.data);
        emit(state.copyWith(status: SignInStatus.success));
      } else {
        emit(state.copyWith(status: SignInStatus.loaded));
      }
    });
  }
}
