class ResetPasswordModel {

  late final String message;
  late final bool status;
  late final Null data;

  ResetPasswordModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = null;
  }


}