// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'dart:convert';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/model/mcq_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UserProviderMcqQuestions extends ChangeNotifier {
  List<McqModel> _posts = [];
  List<McqModel> get posts => _posts;
  bool isLoding = false;

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
