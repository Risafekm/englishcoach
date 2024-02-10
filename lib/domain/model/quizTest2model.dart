// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

List<QuizTest2> quizFromJson(String str) =>
    List<QuizTest2>.from(json.decode(str).map((x) => QuizTest2.fromJson(x)));

String quizToJson(List<QuizTest2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizTest2 {
  String prelimTransQuestion;
  String prelimTransQuesNum;
  String prelimTransAnswer;

  QuizTest2({
    required this.prelimTransQuestion,
    required this.prelimTransQuesNum,
    required this.prelimTransAnswer,
  });

  factory QuizTest2.fromJson(Map<String, dynamic> json) => QuizTest2(
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
