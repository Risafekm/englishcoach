// ignore_for_file: unnecessary_null_comparison, unused_local_variable, camel_case_types

import 'dart:convert';

import 'package:englishcoach/domain/Model/quizTest1model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class userprovidertest1 extends ChangeNotifier {
  List<QuizTest1> _posts = [];
  List<QuizTest1> get posts => _posts;
  bool isLoding = false;
// post controller
  TextEditingController questionController = TextEditingController();
  TextEditingController answersController = TextEditingController();

// update controller
  TextEditingController updatequestionController = TextEditingController();
  TextEditingController updateanswersController = TextEditingController();

// post

  addData(context) async {
    String apiUrl = 'http://localhost/english_coach_php/test1/createtest1.php';
    var userdata = QuizTest1(
      topic_que_num: 0,
      topic_que_question: questionController.text,
      topic_ans_answer: answersController.text,
    );
    try {
      var bodyy = jsonEncode(userdata);
      var response = await http.post(
        Uri.parse(apiUrl),
        body: bodyy,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print('successfully posted');
        var dataa = jsonDecode(response.body);
        snackbar(context, text: "added");
        await getData();
        print('Response body: $dataa');
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }
//get Data

  getData() async {
    isLoding = true;
    String getUrl = 'http://localhost/english_coach_php/test1/readtest1.php';

    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<QuizTest1>.from(
                jsonDecode(response.body).map((e) => QuizTest1.fromJson(e)))
            .toList();
        if (data != null) {
          _posts = data;
          isLoding = false;
          notifyListeners();
        }
      }
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }

  //update

  updateData(int i, context) async {
    Uri updateUrl = Uri.parse(
        'http://localhost/english_coach_php/test1/updatetest1.php?topic_que_num=$i');
    var data = QuizTest1(
      topic_que_num: i,
      topic_que_question: updatequestionController.text,
      topic_ans_answer: updateanswersController.text,
    );

    try {
      var response = await http.put(
        updateUrl,
        body: jsonEncode(data.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        await getData();
        snackbar(context, text: "updated");
        print(" update success ${response.body}");
      }
    } catch (e) {
      print('Error updated failed: ${e.toString()}');
    }
    notifyListeners();
  }

  deleteData(int i, context) async {
    Uri deleteUrl = Uri.parse(
        'http://localhost/english_coach_php/test1/deletetest1.php?topic_que_num=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      snackbar(context, text: "deleted");
      getData();

      print('Successfully deleted');
    }
  }

  clear() {
    questionController.clear();
    answersController.clear();
  }

  //snackBar

  snackbar(context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Row(
          children: [
            Expanded(child: Text('Successfully $text')),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.done, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
