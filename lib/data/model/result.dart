class ProductResult {
  int? result;
  List<Data>? data;

  ProductResult({this.result, this.data});

  ProductResult.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? address;
  int? price;
  String? img;
  int? quantity;
  List<String>? gallery;
  String? dateCreated;
  Null? dateUpdated;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.address,
        this.price,
        this.img,
        this.quantity,
        this.gallery,
        this.dateCreated,
        this.dateUpdated,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    gallery = json['gallery'].cast<String>();
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['price'] = this.price;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    data['gallery'] = this.gallery;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    data['__v'] = this.iV;
    return data;
  }
}