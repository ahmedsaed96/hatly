class HomeModel {
  bool? status;
  Data? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    data = Data.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class Data {
  List<Banner> banners = [];
  List<Product> products = [];
  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((v) {
        banners.add(Banner.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(Product.fromJson(v as Map<String, dynamic>));
      });
    }
  }
}

class Banner {
  int? id;
  String? image;
  Category? category;
  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    image = json['image'] as String;
    category = Category.fromJson(json['category'] as Map<String, dynamic>);
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  String? image;
  String? name;
  String? description;
  // List<String> images = [];
  bool? inFavorites;
  bool? inCart;
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
    // images = json['images'] as List<String>;
    inFavorites = json['in_favorites'] as bool;
    inCart = json['in_cart'] as bool;
  }
}

class Category {
  int? id;
  String? image;
  String? name;
  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    image = json['image'] as String;
    name = json['name'] as String;
  }
}
