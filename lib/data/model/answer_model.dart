class AnswerModel {
  String? answer;
  int? f1Score;
  String? prediction;

  AnswerModel({this.answer, this.f1Score, this.prediction});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    f1Score = json['f1_score'];
    prediction = json['prediction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['f1_score'] = this.f1Score;
    data['prediction'] = this.prediction;
    return data;
  }
}