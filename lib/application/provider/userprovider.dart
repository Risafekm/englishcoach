// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'dart:convert';
import 'package:englishcoach/domain/model/quizmodel.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<Quiz> _posts = [];
  List<Quiz> get posts => _posts;
  bool isLoding = false;

//get Data

  getData() async {
    isLoding = true;
    String getUrl = 'http://localhost/englishcoach/readtest2.php';
    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<Quiz>.from(
            jsonDecode(response.body).map((e) => Quiz.fromJson(e))).toList();
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
