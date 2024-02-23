// To parse this JSON data, do
//
//     final finalTest = finalTestFromJson(jsonString);

import 'dart:convert';

List<FinalTest> finalTestFromJson(String str) =>
    List<FinalTest>.from(json.decode(str).map((x) => FinalTest.fromJson(x)));

String finalTestToJson(List<FinalTest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinalTest {
  String finalQuestions;
  String finalQuesNumber;
  String finalAnswers;

  FinalTest({
    required this.finalQuestions,
    required this.finalQuesNumber,
    required this.finalAnswers,
  });

  factory FinalTest.fromJson(Map<String, dynamic> json) => FinalTest(
        finalQuestions: json["final_questions"],
        finalQuesNumber: json["final_ques_number"],
        finalAnswers: json["final_answers"],
      );

  Map<String, dynamic> toJson() => {
        "final_questions": finalQuestions,
        "final_ques_number": finalQuesNumber,
        "final_answers": finalAnswers,
      };
}
