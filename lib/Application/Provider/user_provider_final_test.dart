// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:englishcoach/domain/model/final_test_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserproviderFinalTest extends ChangeNotifier {
  List<FinalTest> _posts = [];
  List<FinalTest> get posts => _posts;
  bool isLoding = false;
// post controller
  TextEditingController questionController = TextEditingController();
  TextEditingController answersController = TextEditingController();

// update controller
  TextEditingController updatequestionController = TextEditingController();
  TextEditingController updateanswersController = TextEditingController();

// post

  addData(context) async {
    String apiUrl =
        'https://api.muhammedhafiz.com/sana/final_test/create_final_test.php';
    var userdata = FinalTest(
        finalQuestions: questionController.text,
        finalQuesNumber: '',
        finalAnswers: answersController.text);
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
        // snackbar(context, text: "added");
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
    String getUrl =
        'https://api.muhammedhafiz.com/sana/final_test/read_final_test.php';

    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<FinalTest>.from(
                jsonDecode(response.body).map((e) => FinalTest.fromJson(e)))
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

  updateData(String i, context) async {
    Uri updateUrl = Uri.parse(
        'https://api.muhammedhafiz.com/sana/final_test/update_final_test.php?final_ques_number=$i');
    var data = FinalTest(
      finalQuesNumber: i,
      finalAnswers: updateanswersController.text,
      finalQuestions: updatequestionController.text,
    );

    try {
      var response = await http.put(
        updateUrl,
        body: jsonEncode(data.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        await getData();
        // snackbar(context, text: "updated");
        print(" update success ${response.body}");
      }
    } catch (e) {
      print('Error updated failed: ${e.toString()}');
    }
    notifyListeners();
  }

  deleteData(String i, context) async {
    Uri deleteUrl = Uri.parse(
        'https://api.muhammedhafiz.com/sana/final_test/delete_final_test.php?final_ques_number=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      // snackbar(context, text: "deleted");
      getData();

      print('Successfully deleted');
    }
  }

  clear() {
    questionController.clear();
    answersController.clear();
  }
}
