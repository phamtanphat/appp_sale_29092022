import 'dart:async';
import 'dart:convert';


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

      print(products);

      return data ?? [];

    } on DioError catch (dioError) {
      return [];
    } catch(e) {
      return [];
    }


  }
}