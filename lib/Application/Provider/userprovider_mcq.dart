// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/model/mcq_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UserMcqQuestionsOptions extends ChangeNotifier {
  List<McqModel> _posts = [];
  List<McqModel> get posts => _posts;
  bool isLoding = false;
// post controller
  final questionController = TextEditingController();
  final answersController = TextEditingController();
  final option1Controller = TextEditingController();
  final option2Controller = TextEditingController();
  final option3Controller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Future<void> addData(BuildContext context) async {
    String apiUrl = 'http://localhost/english_coach_php/mqc/createmqc.php';

    // Construct the userdata object
    var userdata = {
      "question": questionController.text,
      "options": [
        option1Controller.text.toString(),
        option2Controller.text.toString(),
        option3Controller.text.toString(),
      ],
      "mcq_answer": answersController.text,
    };

    try {
      // Encode the userdata object to JSON
      var bodyy = jsonEncode(userdata);

      // Send the POST request to the server
      var response = await http.post(
        Uri.parse(apiUrl),
        body: bodyy,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Request successful
        print('Successfully posted');
        var dataa = jsonDecode(response.body);
        print('Response body: $dataa');
        snackbar(context, text: "Added");
        await getData();
      } else {
        // Request failed
        print('Failed to post data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        snackbar(context, text: "Failed");
        notifyListeners();
      }
    } catch (e) {
      // Error occurred during the request
      print('Error: $e');
      snackbar(context, text: "Catch error");
      notifyListeners();
    }
  }
//get Data

  getData() async {
    isLoding = true;
    String getUrl = 'http://localhost/english_coach_php/mqc/readmcq.php';

    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<McqModel>.from(
                jsonDecode(response.body).map((e) => McqModel.fromJson(e)))
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

  //delete
  deleteData(int i, context) async {
    Uri deleteUrl = Uri.parse(
        'localhost/english_coach_php/test1/deletemcq.php?trail_mcq_num=$i');

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
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
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
            const Icon(Icons.done, color: AppColors.accentColor1),
          ],
        ),
      ),
    );
  }
}
