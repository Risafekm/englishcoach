// To parse this JSON data, do
//
//     final mcqModel = mcqModelFromJson(jsonString);

import 'dart:convert';

List<McqModel> mcqModelFromJson(String str) =>
    List<McqModel>.from(json.decode(str).map((x) => McqModel.fromJson(x)));

String mcqModelToJson(List<McqModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class McqModel {
  String questionNo;
  String question;
  List<String> options;
  String correctAnswer;

  McqModel({
    required this.questionNo,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory McqModel.fromJson(Map<String, dynamic> json) => McqModel(
        questionNo: json["question_no"],
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        correctAnswer: json["correct_answer"],
      );

  Map<String, dynamic> toJson() => {
        "question_no": questionNo,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "correct_answer": correctAnswer,
      };
}
