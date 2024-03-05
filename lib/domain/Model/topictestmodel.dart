// To parse this JSON data, do
//
//     final topicTest = topicTestFromJson(jsonString);

import 'dart:convert';

List<TopicTest> topicTestFromJson(String str) =>
    List<TopicTest>.from(json.decode(str).map((x) => TopicTest.fromJson(x)));

String topicTestToJson(List<TopicTest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopicTest {
  String topicQueNum;
  String topicAnsAnswer;
  String topicQueQuestion;

  TopicTest({
    required this.topicQueNum,
    required this.topicAnsAnswer,
    required this.topicQueQuestion,
  });

  factory TopicTest.fromJson(Map<String, dynamic> json) => TopicTest(
        topicQueNum: json["topic_que_num"],
        topicAnsAnswer: json["topic_ans_answer"],
        topicQueQuestion: json["topic_que_question"],
      );

  Map<String, dynamic> toJson() => {
        "topic_que_num": topicQueNum,
        "topic_ans_answer": topicAnsAnswer,
        "topic_que_question": topicQueQuestion,
      };
}
