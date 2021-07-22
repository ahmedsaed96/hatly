class UserRegisterModel {
  bool? status;
  String? message;
  Data? data;
  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    message = json['message'] != null ? json['message'] as String : null;
    data = json['data'] != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : null;
    name = json['name'] as String;
    email = json['email'] as String;
    phone = json['phone'] as String;
    image = json['image'] as String;

    token = json['token'] as String;
  }
}
