import 'dart:convert';

List<Quiz> quizFromJson(String str) =>
    List<Quiz>.from(json.decode(str).map((x) => Quiz.fromJson(x)));

String quizToJson(List<Quiz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quiz {
  int topic_que_num;
  String topic_que_question;
  String topic_ans_answer;

  Quiz({
    required this.topic_que_num,
    required this.topic_que_question,
    required this.topic_ans_answer,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
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
