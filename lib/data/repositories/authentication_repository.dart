import 'dart:async';

import 'package:appp_sale_29092022/data/datasources/remote/api_request.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/app_resource.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/user_dto.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  late ApiRequest _apiRequest;

  void updateApiRequest(ApiRequest apiRequest) {
    _apiRequest = apiRequest;
  }

  Future<AppResource<UserDTO>> signIn(String email, String password) async{
    Completer<AppResource<UserDTO>> completer = Completer();
    try {
      var response =  await _apiRequest.signInRequest(email, password);
      print(response);
    } on DioError catch (dioError) {
      print(dioError.response?.data["message"]);
    } catch(e) {

    }

    return completer.future;
  }
}