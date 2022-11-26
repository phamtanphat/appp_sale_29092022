import 'package:appp_sale_29092022/common/bases/base_bloc.dart';
import 'package:appp_sale_29092022/common/bases/base_event.dart';
import 'package:appp_sale_29092022/data/repositories/product_repository.dart';

class HomeBloc extends BaseBloc {
  late ProductRepository _productRepository;

  void updateAuthenRepo(ProductRepository productRepository) {
    _productRepository = productRepository;
  }


  @override
  void dispatch(BaseEvent event) {

  }

}