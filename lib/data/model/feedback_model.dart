class FeedbackModel {
  String? message;
  bool? status;
  Null? data;

  FeedbackModel({this.message, this.status, this.data});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }

}