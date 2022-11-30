import 'dart:isolate';

import 'package:appp_sale_29092022/common/constants/api_constant.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dio_client.dart';
import 'package:dio/dio.dart';

import '../../../common/constants/variable_constant.dart';
import '../local/cache/app_cache.dart';

class ApiRequest {
  late Dio _dio;

  ApiRequest() {
    _dio = DioClient.instance.dio;
  }

  Future signInRequest(String email, String password) {
    return _dio.post(ApiConstant.SIGN_IN, data: {
      "email": email,
      "password": password
    });
  }

  Future signUpRequest(
      String name,
      String email,
      String phone,
      String password,
      String address
  ) {
    return _dio.post(ApiConstant.SIGN_UP, data: {
      "name": name,
      "phone": phone,
      "address": address,
      "email": email,
      "password": password
    });
  }

  Future getProducts() async {
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn((SendPort sendPort) {
      _dio.get(ApiConstant.PRODUCTS)
          .then((value) => sendPort.send(value))
          .catchError((error) => sendPort.send(error));
    }, receivePort.sendPort);

    return receivePort.first;
  }

  Future getCart() {
    return _dio.get(ApiConstant.CART,
        options: Options(
            headers: {
              "authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI0MzM3NzQ5OTQsImRhdGEiOnsiX2lkIjoiNjJiNzJhZTM1ZTRlNmU2ZTNjNmE4MWQ5IiwiZW1haWwiOiJkZW1vMUBnbWFpbC5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRlcGdxQXJMbGdrSklWdGc0QWtEcUR1QjB6Z1RKVU9waW1LVURESnJvM09tOWR0MWdiL2MvbSIsIm5hbWUiOiJwaGF0IiwicGhvbmUiOiIxMjM0NTY3ODkxMCIsInVzZXJHcm91cCI6MCwicmVnaXN0ZXJEYXRlIjoiMjAyMi0wNi0yNVQxNTozMzo1NS4wNzBaIiwiX192IjowfSwiaWF0IjoxNjU2MTc0OTk0fQ.bUDANXsWOZv0Z_FGslX-7Mihygwm4txSwack8Xj4tkI",
            }
       )
    );
  }

  Future addToCart(String idProduct) {
    return _dio.post(ApiConstant.ADD_CART,
        data: {"id_product": idProduct},
        options: Options(
            headers: {
              "authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI0MzM3NzQ5OTQsImRhdGEiOnsiX2lkIjoiNjJiNzJhZTM1ZTRlNmU2ZTNjNmE4MWQ5IiwiZW1haWwiOiJkZW1vMUBnbWFpbC5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRlcGdxQXJMbGdrSklWdGc0QWtEcUR1QjB6Z1RKVU9waW1LVURESnJvM09tOWR0MWdiL2MvbSIsIm5hbWUiOiJwaGF0IiwicGhvbmUiOiIxMjM0NTY3ODkxMCIsInVzZXJHcm91cCI6MCwicmVnaXN0ZXJEYXRlIjoiMjAyMi0wNi0yNVQxNTozMzo1NS4wNzBaIiwiX192IjowfSwiaWF0IjoxNjU2MTc0OTk0fQ.bUDANXsWOZv0Z_FGslX-7Mihygwm4txSwack8Xj4tkI",
            }
        )
    );
  }

}