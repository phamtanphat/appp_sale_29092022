import 'Product.dart';

class Cart {
  String id = "";
  List<Product> products = [];
  String id_user = "";
  int price = 0;
  String date_created = "";

  Cart(String? id, List<Product>? products, String? id_user, int? price, String? data_created) {
    this.id = id ?? "";
    this.products = products ?? [];
    this.id_user = id_user ?? "";
    this.price = price ?? 0;
    this.date_created = date_created ?? "";
  }

  void updateCart(String? id, List<Product>? products, String? id_user, int? price, String? data_created){
    this.id = id ?? "";
    this.products = products ?? [];
    this.id_user = id_user ?? "";
    this.price = price ?? 0;
    this.date_created = date_created ?? "";
  }

  @override
  String toString() {
    return 'Cart{id: $id, products: $products, id_user: $id_user, price: $price, date_created: $date_created}';
  }
}
