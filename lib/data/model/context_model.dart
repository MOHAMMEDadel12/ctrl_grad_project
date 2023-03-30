class ContextModel {

   bool? success;
   List<String>? data;

  ContextModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.castFrom<dynamic, String>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data;
    return _data;
  }
}