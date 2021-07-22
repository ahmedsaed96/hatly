class SearchModel {
  bool? status;
  Data? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is bool) status = json["status"] as bool;

    if (json["data"] is Map) {
      data = json["data"] == null
          ? null
          : Data.fromJson(json["data"] as Map<String, dynamic>);
    }
  }
}

class Data {
  // int? currentPage;
  List<Data1>? data;
  // String? firstPageUrl;
  // int? from;
  // int? lastPage;
  // String? lastPageUrl;
  // dynamic nextPageUrl;
  // String? path;
  // int? perPage;
  
  // int? to;
  // int? total;

  Data.fromJson(Map<String, dynamic> json) {
    // if (json["current_page"] is int) currentPage = json["current_page"] as int;
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => Data1.fromJson(e as Map<String, dynamic>))
              .toList();
    }
    // if (json["first_page_url"] is String) {
    //   firstPageUrl = json["first_page_url"] as String;
    // }
    // if (json["from"] is int) from = json["from"] as int;
    // if (json["last_page"] is int) lastPage = json["last_page"] as int;
    // if (json["last_page_url"] is String) {
    //   lastPageUrl = json["last_page_url"] as String;
    // }
    // nextPageUrl = json["next_page_url"];
    // if (json["path"] is String) path = json["path"] as String;
    // if (json["per_page"] is int) perPage = json["per_page"] as int;
    
    // if (json["to"] is int) to = json["to"] as int;
    // if (json["total"] is int) total = json["total"] as int;
  }
}

class Data1 {
  int? id;
  int? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Data1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"] as int;
    if (json["price"] is int) price = json["price"] as int;
    if (json["image"] is String) image = json["image"] as String;
    if (json["name"] is String) name = json["name"] as String;
    if (json["description"] is String) {
      description = json["description"] as String;
    }
    if (json["images"] is List) {
      images = json["images"] == null
          ? null
          : List<String>.from(json["images"] as List);
    }
    if (json["in_favorites"] is bool) {
      inFavorites = json["in_favorites"] as bool;
    }
    if (json["in_cart"] is bool) inCart = json["in_cart"] as bool;
  }
}
