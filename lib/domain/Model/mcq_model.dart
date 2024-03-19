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
  String mcq_answer;

  McqModel({
    required this.questionNo,
    required this.question,
    required this.options,
    required this.mcq_answer,
  });

  factory McqModel.fromJson(Map<String, dynamic> json) {
    return McqModel(
      questionNo: json["question_no"] ?? "", // Provide a default value if null
      question: json["question"] ?? "", // Provide a default value if null
      options: List<String>.from(
          json["options"] ?? []), // Provide an empty list if null
      mcq_answer: json["mcq_answer"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "question_no": questionNo,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "mcq_answer": mcq_answer,
      };
}
