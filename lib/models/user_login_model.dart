class UserLoginModel {
  bool? status;
  String? message;
  Data? data;
  UserLoginModel.fromJson(Map<String, dynamic> json) {
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
  int? points;
  int? credit;
  String? token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    email = json['email'] as String;
    phone = json['phone'] as String;
    image = json['image'] as String;

    points = json['points'] as int;
    credit = json['credit'] as int;
    token = json['token'] as String;
  }
}
