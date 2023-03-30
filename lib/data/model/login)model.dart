class LoginModel {
  Success? success;
  String? jwt;

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = Success.fromJson(json['success']);
    jwt = json['jwt'];
  }
}

class Success {
  String? message;
  bool? status;
  Data? data;

  Success.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  String? id;
  String? username;
  String? email;
  String? password;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }
}
