import 'package:appp_sale_29092022/common/constants/api_constant.dart';
import 'package:appp_sale_29092022/common/constants/variable_constant.dart';
import 'package:appp_sale_29092022/data/datasources/local/cache/app_cache.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dio_client.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  late Dio _dio;

  ApiRequest() {
    _dio = DioClient.instance.dio;
  }

  Future signInRequest(String email, String password) {
    return _dio.post(ApiConstant.SIGN_IN,
        data: {"email": email, "password": password});
  }

  Future signUpRequest(String name, String email, String phone, String password,
      String address) {
    return _dio.post(ApiConstant.SIGN_UP, data: {
      "name": name,
      "phone": phone,
      "address": address,
      "email": email,
      "password": password
    });
  }

  Future getProducts() {
    return _dio.get(ApiConstant.PRODUCTS);
  }

  Future getCart() {
    return _dio.get(ApiConstant.CART,
        options: Options(headers: {
          "authorization": "Bearer ${AppCache.getString(VariableConstant.TOKEN)}",
        }));
  }

  Future updateCart(String idProduct, int quantity){
    return _dio.post(ApiConstant.UPDATE_CART,
        data: {
          "id_product": idProduct,
          "id_cart": AppCache.getString(VariableConstant.CART_ID),
          "quantity": quantity
        },
        options: Options(
            headers: {
      "authorization": "Bearer ${AppCache.getString(VariableConstant.TOKEN)}",
    }));
  }

  Future addToCart(String idProduct){
    return _dio.post(ApiConstant.UPDATE_CART,
        data: {
          "id_product": idProduct
        },
        options: Options(headers: {
          "authorization": "Bearer ${AppCache.getString(VariableConstant.TOKEN)}",
        }));
  }

}
