// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'dart:convert';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/model/quizTest2model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UserProviderTest2 extends ChangeNotifier {
  List<QuizTest2> _posts = [];
  List<QuizTest2> get posts => _posts;
  bool isLoding = false;

  // post controller
  TextEditingController quesController = TextEditingController();
  TextEditingController ansController = TextEditingController();

  //update Controller

  TextEditingController editQuesController = TextEditingController();
  TextEditingController editAnsController = TextEditingController();

  //post Data

  addData(context) async {
    String apiUrl = 'http://localhost/english_coach_php/test2/createtest2.php';
    var userdata = QuizTest2(
      prelimTransQuestion: quesController.text.trim(),
      prelimTransQuesNum: '',
      prelimTransAnswer: ansController.text.trim(),
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
    String getUrl = 'http://localhost/english_coach_php/test2/readtest2.php';
    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<QuizTest2>.from(
                jsonDecode(response.body).map((e) => QuizTest2.fromJson(e)))
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

  //update data

  updateData(String i, context) async {
    Uri updateUrl = Uri.parse(
        'http://localhost/english_coach_php/test2/updatetest2.php?prelim_trans_ques_num=$i');
    var data = QuizTest2(
      prelimTransQuestion: editQuesController.text.trim(),
      prelimTransQuesNum: '',
      prelimTransAnswer: editAnsController.text.trim(),
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

  //delete

  deleteData(String i, context) async {
    Uri deleteUrl = Uri.parse(
        'http://localhost/english_coach_php/test2/deletetest2.php?prelim_trans_ques_num=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      snackbar(context, text: "deleted");
      getData();

      print('Successfully deleted');
    }
  }

  clear() {
    quesController.clear();
    ansController.clear();
  }

  //snackBar

  snackbar(context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.accentColor2,
        content: Row(
          children: [
            Expanded(child: Text('Successfully $text')),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.done, color:AppColors.accentColor1),
          ],
        ),
      ),
    );
  }
}
