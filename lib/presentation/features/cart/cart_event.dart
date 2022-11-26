import 'package:appp_sale_29092022/common/bases/base_event.dart';

class GetCartEvent extends BaseEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class IncreaseCartItemEvent extends BaseEvent{
  String idProduct;
  int quantity;

  IncreaseCartItemEvent(this.idProduct, this.quantity);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DecreaseCartItemEvent extends BaseEvent{
  String idProduct;
  int quantity;

  DecreaseCartItemEvent(this.idProduct, this.quantity);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}