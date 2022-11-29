import 'dart:async';
import 'dart:convert';


import 'package:appp_sale_29092022/common/constants/variable_constant.dart';
import 'package:appp_sale_29092022/data/datasources/local/cache/app_cache.dart';
import 'package:appp_sale_29092022/data/model/cart_result_model.dart';
import 'package:appp_sale_29092022/data/model/result.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  Dio _dio = Dio();


  Future<List<Data>> getProducts() async{
    String apiUrl ="https://serverappsale.herokuapp.com/product";
    try {
      Response response =  await _dio.get(apiUrl);
      // TODO: Improve use Isolate
      ProductResult products = ProductResult.fromJson(response.data);
      List<Data>? data = products.data;

      return data ?? [];

    } on DioError catch (dioError) {
      return [];
    } catch(e) {
      return [];
    }
  }

  Future<List<Products>> getCartProducts() async{
    String apiUrl ="https://serverappsale.herokuapp.com/cart";
    String token = AppCache.getString(VariableConstant.TOKEN);
    _dio.options.headers["Authorization"] = "Bearer $token";
    try {

      Response response =  await _dio.get(apiUrl);

      // TODO: Improve use Isolate


      CartData cartData = CartData.fromJson((response.data["data"]));
      List<Products>? products = cartData.products;

      return products ?? [];

    } on DioError catch (dioError) {
      return [];
    } catch(e) {
      return [];
    }
  }

  Future<String> addToCart(String product_id) async{
    String apiUrl ="https://serverappsale.herokuapp.com/cart/add";
    String token = AppCache.getString(VariableConstant.TOKEN);
    _dio.options.headers["Authorization"] = "Bearer $token";
    try {

      Response response =  await _dio.post(apiUrl,data: {'id_product':product_id});

      // TODO: Improve use Isolate

      return "success";

    } on DioError catch (dioError) {
      return dioError.toString();
    } catch(e) {
      return e.toString();
    }
  }

}