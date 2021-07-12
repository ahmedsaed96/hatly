class OnlineFavorites {
  bool? status;
  Data? data;
  OnlineFavorites.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    data = json['data'] != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  List<InnerData>? innerData = [];
  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((element) {
        innerData!.add(InnerData.fromJson(element as Map<String, dynamic>));
      });
    }
  }
}

class InnerData {
  int? id;
  Product? product;
  InnerData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    product = Product.fromJson(json['product'] as Map<String, dynamic>);
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'] as int;
    image = json['image'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
  }
}
