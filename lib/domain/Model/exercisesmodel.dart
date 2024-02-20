// To parse this JSON data, do
//
//     final exercises = exercisesFromJson(jsonString);

import 'dart:convert';

List<Exercises> exercisesFromJson(String str) =>
    List<Exercises>.from(json.decode(str).map((x) => Exercises.fromJson(x)));

String exercisesToJson(List<Exercises> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exercises {
  String exeNum;
  String modNum;
  String exeQuestion;
  String exeAnswer;
  String exeSentenceRule;

  Exercises({
    required this.exeNum,
    required this.modNum,
    required this.exeQuestion,
    required this.exeAnswer,
    required this.exeSentenceRule,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
        exeNum: json["exe_num"],
        modNum: json["mod_num"],
        exeQuestion: json["exe_question"],
        exeAnswer: json["exe_answer"],
        exeSentenceRule: json["exe_sentence_rule"],
      );

  Map<String, dynamic> toJson() => {
        "exe_num": exeNum,
        "mod_num": modNum,
        "exe_question": exeQuestion,
        "exe_answer": exeAnswer,
        "exe_sentence_rule": exeSentenceRule,
      };
}
