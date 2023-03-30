class RegisterModel {

   String ?  message;
   bool ?  status;

  RegisterModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
  }


}