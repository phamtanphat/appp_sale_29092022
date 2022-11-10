import 'dart:async';

import 'package:appp_sale_29092022/data/datasources/remote/api_request.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/app_resource.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/user_dto.dart';

class AuthenticationRepository {
  late ApiRequest _apiRequest;

  void updateApiRequest(ApiRequest apiRequest) {
    _apiRequest = apiRequest;
  }

  Future<AppResource<UserDTO>> signIn(String email, String password) {
    Completer<AppResource<UserDTO>> completer = Completer();
    _apiRequest.signInRequest(email, password)
          .then((value) => print(value))
          .catchError((error) => print("Error $error}"));
    return completer.future;
  }
}