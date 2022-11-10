import 'package:appp_sale_29092022/common/constants/api_constant.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dio_client.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  late Dio dio;

  ApiRequest() {
    dio = DioClient.instance.dio;
  }

  Future signInRequest(String email, String password) {
    return dio.post(ApiConstant.SIGN_IN, data: {
      "email": email,
      "password": password
    });
  }
}