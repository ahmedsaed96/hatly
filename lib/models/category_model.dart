class CategoryModel {
  bool? status;
  CategoryData? data;
  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    data =json['data'] != null ?  CategoryData.fromJson(json['data'] as Map<String, dynamic>):null;
  }
}

class CategoryData {
  List<Data>? data=[];
  CategoryData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data!.add(Data.fromJson(element as Map<String, dynamic>));
      });
    }
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    image = json['image'] as String;
  }
}
