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
      Response<dynamic> response =  await _apiRequest.signInRequest(email, password);
      AppResource<UserDTO> resourceUserDTO = AppResource.fromJson(response.data, UserDTO.fromJson);
      completer.complete(resourceUserDTO);
    } on DioError catch (dioError) {
      completer.completeError(dioError.response?.data["message"]);
    } catch(e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }
}