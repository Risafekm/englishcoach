import 'dart:convert';

List<QuizTest1> quizFromJson(String str) =>
    List<QuizTest1>.from(json.decode(str).map((x) => QuizTest1.fromJson(x)));

String quizToJson(List<QuizTest1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizTest1 {
  int topic_que_num;
  String topic_que_question;
  String topic_ans_answer;

  QuizTest1({
    required this.topic_que_num,
    required this.topic_que_question,
    required this.topic_ans_answer,
  });

  factory QuizTest1.fromJson(Map<String, dynamic> json) => QuizTest1(
        topic_que_num: int.parse(json["topic_que_num"]),
        topic_que_question: json["topic_que_question"],
        topic_ans_answer: json["topic_ans_answer"],
      );

  Map<String, dynamic> toJson() => {
        "topic_que_num": topic_que_num,
        "topic_que_question": topic_que_question,
        "topic_ans_answer": topic_ans_answer,
      };
}
