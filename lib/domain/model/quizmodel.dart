// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

List<Quiz> quizFromJson(String str) =>
    List<Quiz>.from(json.decode(str).map((x) => Quiz.fromJson(x)));

String quizToJson(List<Quiz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quiz {
  String prelimTransQuestion;
  String prelimTransQuesNum;
  String prelimTransAnswer;

  Quiz({
    required this.prelimTransQuestion,
    required this.prelimTransQuesNum,
    required this.prelimTransAnswer,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        prelimTransQuestion: json["prelim_trans_question"],
        prelimTransQuesNum: json["prelim_trans_ques_num"],
        prelimTransAnswer: json["prelim_trans_answer"],
      );

  Map<String, dynamic> toJson() => {
        "prelim_trans_question": prelimTransQuestion,
        "prelim_trans_ques_num": prelimTransQuesNum,
        "prelim_trans_answer": prelimTransAnswer,
      };
}
