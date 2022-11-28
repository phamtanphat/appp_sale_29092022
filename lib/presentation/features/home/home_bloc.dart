import 'dart:async';

import 'package:appp_sale_29092022/common/bases/base_bloc.dart';
import 'package:appp_sale_29092022/common/bases/base_event.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/app_resource.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/product_dto.dart';
import 'package:appp_sale_29092022/data/model/result.dart';
import 'package:appp_sale_29092022/data/repositories/product_repository.dart';
import 'package:appp_sale_29092022/presentation/features/home/home_event.dart';
import 'package:flutter/cupertino.dart';

class HomeBloc extends BaseBloc {

  ProductRepository _repo = ProductRepository();
  StreamController<dynamic> _streamController = StreamController<dynamic>();
  Stream<dynamic> get getStream => _streamController.stream;

  HomeBloc(){
    ProductRepository repo;
    repo = _repo;
  }

  @override
  void dispatch(BaseEvent event) {
    // TODO: implement dispatch
    switch(event.runtimeType){
      case FetchProductEvent:
        _executeGetProducts(event as FetchProductEvent);
        break;

    }
  }

  void _executeGetProducts(FetchProductEvent event) async{
    var products = _repo.getProducts();
    products.then((res) {
      _streamController.sink.add(res);
    },
    onError: (err) => print(err.toString()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }



}