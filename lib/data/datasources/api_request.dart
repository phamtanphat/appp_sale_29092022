import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRequest {
  Future<Response?> signUp() async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/user/sign-up',
        data: {
          "email": "luubaongan3110@gmail.com",
          "name": "BaoBao",
          "password": "baobao1234",
          "phone": "0773604340",
          "address": "Quận BinhTan",
        },
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/user/sign-in',
        data: {
          "email": email,
          "password": password,
        },
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> addCart({required String idProduct}) async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/cart/add',
        data: {
          "id_product": idProduct,
        },
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI0NDU1MDg5ODMsImRhdGEiOnsiX2lkIjoiNjM2YTQ0Y2M5NDA5YjUyZTVkNjNhODNjIiwiZW1haWwiOiJsdXViYW9uZ2FuMzExMEBnbWFpbC5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRSZ3NMbElJWWFpN2piTUdaQWZjbjJPMUdabDZXSHgxMmoyNnl5UnkzbEJvbnFpak41SmtFMiIsIm5hbWUiOiJCYW9CYW8iLCJwaG9uZSI6IjA3NzM2MDQzNDAiLCJ1c2VyR3JvdXAiOjAsInJlZ2lzdGVyRGF0ZSI6IjIwMjItMTEtMDhUMTI6MDA6MTIuMjA1WiIsIl9fdiI6MH0sImlhdCI6MTY2NzkwODk4M30.uOwHKNIzzyBY9ZZaNxqpY-REXH5ZChC6HETQzJLsQHg",
        }),
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> getProducts() async {
    try {
      var response = await Dio().get(
        'https://serverappsale.onrender.com/product',
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> updateCart() async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/cart/update',
        data: {
          "id_product": "62b72b165e4e6e6e3c6a81e6",
          "id_cart": "62b73abce722e9050c46a837",
          "quantity": 9,
        },
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI0NDU1MDg5ODMsImRhdGEiOnsiX2lkIjoiNjM2YTQ0Y2M5NDA5YjUyZTVkNjNhODNjIiwiZW1haWwiOiJsdXViYW9uZ2FuMzExMEBnbWFpbC5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRSZ3NMbElJWWFpN2piTUdaQWZjbjJPMUdabDZXSHgxMmoyNnl5UnkzbEJvbnFpak41SmtFMiIsIm5hbWUiOiJCYW9CYW8iLCJwaG9uZSI6IjA3NzM2MDQzNDAiLCJ1c2VyR3JvdXAiOjAsInJlZ2lzdGVyRGF0ZSI6IjIwMjItMTEtMDhUMTI6MDA6MTIuMjA1WiIsIl9fdiI6MH0sImlhdCI6MTY2NzkwODk4M30.uOwHKNIzzyBY9ZZaNxqpY-REXH5ZChC6HETQzJLsQHg",
        }),
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> orderHisory() async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/order/history',
        data: null,
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI0NDU1MDg5ODMsImRhdGEiOnsiX2lkIjoiNjM2YTQ0Y2M5NDA5YjUyZTVkNjNhODNjIiwiZW1haWwiOiJsdXViYW9uZ2FuMzExMEBnbWFpbC5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRSZ3NMbElJWWFpN2piTUdaQWZjbjJPMUdabDZXSHgxMmoyNnl5UnkzbEJvbnFpak41SmtFMiIsIm5hbWUiOiJCYW9CYW8iLCJwaG9uZSI6IjA3NzM2MDQzNDAiLCJ1c2VyR3JvdXAiOjAsInJlZ2lzdGVyRGF0ZSI6IjIwMjItMTEtMDhUMTI6MDA6MTIuMjA1WiIsIl9fdiI6MH0sImlhdCI6MTY2NzkwODk4M30.uOwHKNIzzyBY9ZZaNxqpY-REXH5ZChC6HETQzJLsQHg",
        }),
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> cartConform() async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/cart/conform',
        data: {
          "id_cart": "62b73abce722e9050c46a837",
          "status": false,
        },
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjI0NDU1MDg5ODMsImRhdGEiOnsiX2lkIjoiNjM2YTQ0Y2M5NDA5YjUyZTVkNjNhODNjIiwiZW1haWwiOiJsdXViYW9uZ2FuMzExMEBnbWFpbC5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRSZ3NMbElJWWFpN2piTUdaQWZjbjJPMUdabDZXSHgxMmoyNnl5UnkzbEJvbnFpak41SmtFMiIsIm5hbWUiOiJCYW9CYW8iLCJwaG9uZSI6IjA3NzM2MDQzNDAiLCJ1c2VyR3JvdXAiOjAsInJlZ2lzdGVyRGF0ZSI6IjIwMjItMTEtMDhUMTI6MDA6MTIuMjA1WiIsIl9fdiI6MH0sImlhdCI6MTY2NzkwODk4M30.uOwHKNIzzyBY9ZZaNxqpY-REXH5ZChC6HETQzJLsQHg",
        }),
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> refreshToken() async {
    try {
      var response = await Dio().post(
        'https://serverappsale.onrender.com/user/refresh-token',
        data: {
          "email": "luubaongan3110@gmail.com",
          "password": "baobao1234",
        },
      );
      print('$response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Response?> cart() async {
    try {
      var response = await Dio().get(
        'https://serverappsale.onrender.com/user/refresh-token',
      );
      print('response: $response');
      return response;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }
}
