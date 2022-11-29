import 'dart:async';

import 'package:appp_sale_29092022/common/bases/base_bloc.dart';
import 'package:appp_sale_29092022/common/bases/base_event.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/app_resource.dart';
import 'package:appp_sale_29092022/data/datasources/remote/dto/product_dto.dart';
import 'package:appp_sale_29092022/data/model/cart_result_model.dart';
import 'package:appp_sale_29092022/data/model/result.dart';
import 'package:appp_sale_29092022/data/repositories/product_repository.dart';
import 'package:appp_sale_29092022/presentation/features/home/home_event.dart';
import 'package:flutter/cupertino.dart';

class HomeBloc extends BaseBloc {

  ProductRepository _repo = ProductRepository();
  StreamController<List<Data>> _streamController = StreamController<List<Data>>();
  StreamController<int> _streamProductCartController = StreamController<int>();
  StreamController<String> _streamAddToCartController = StreamController<String>();
  Stream<List<Data>> get getStream => _streamController.stream;
  Stream<int> get getCartStream => _streamProductCartController.stream;
  Stream<String> get getStatusAddToCart => _streamAddToCartController.stream;

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
      case LoadCartOnAppbar:
        _getCartOnAppbar();
        break;
      case AddToCartEvent:
        _addToCart(event as AddToCartEvent);
    }
  }

  void _executeGetProducts(FetchProductEvent event) async{
    var products = _repo.getProducts();
    products.then((res) {
      _streamController.sink.add(res);
    },
    onError: (err) => print("Chay vao ham err bloc ${err.toString()}"));
  }

  void _getCartOnAppbar() async{
    var products = _repo.getCartProducts();

    products.then((res) {
      List<Products> items = res;
      int count=0;
      if(items.isNotEmpty){
        for(var i=0; i<items.length;i++){
          count+=items[i].quantity ?? 0;
        }
      }
      _streamProductCartController.sink.add(count);
    },
        onError: (err) => print("Chay vao ham err bloc ${err.toString()}"));
  }

  void _addToCart(AddToCartEvent event){
    if(event.productId.isEmpty){
      _streamAddToCartController.sink.addError("error");
    }
    _streamAddToCartController.sink.add("adding");
    _repo.addToCart(event.productId).then((res) {
      _streamAddToCartController.sink.add(res);
      dispatch(LoadCartOnAppbar());
    }
        , onError:  (err) => _streamAddToCartController.sink.addError(err));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
    _streamProductCartController.close();
    _streamAddToCartController.close();
  }



}