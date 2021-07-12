class ChangeFavoriteModel {
  bool? status;
  String? message;
  Data? data;//عاوز اخذنها لوكال
  ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    message = json['message'] as String;
    data = json['data'] != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  int? id;
  Product? product;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    product = json['product'] != null
        ? Product.fromJson(json['product'] as Map<String, dynamic>)
        : null;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'] as int;
    image = json['image'] as String;
  }
}
