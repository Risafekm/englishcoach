// ignore_for_file: unnecessary_null_comparison, unused_local_variable, camel_case_types

import 'dart:convert';
import 'package:englishcoach/domain/model/modulesmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserproviderModules extends ChangeNotifier {
  List<Modules> _posts = [];
  List<Modules> get posts => _posts;
  bool isLoding = false;
// post controller
  TextEditingController modorderController = TextEditingController();
  TextEditingController tnumController = TextEditingController();
  TextEditingController modnameController = TextEditingController();
  TextEditingController modcontentController = TextEditingController();
  TextEditingController moddescriptionController = TextEditingController();
  TextEditingController modspecialnoteController = TextEditingController();

// update controller
  TextEditingController editmodnumController = TextEditingController();
  TextEditingController edittnumController = TextEditingController();
  TextEditingController editmodnameController = TextEditingController();
  TextEditingController editmodcontentController = TextEditingController();
  TextEditingController editmodorderController = TextEditingController();
  TextEditingController editmoddescriptionController = TextEditingController();
  TextEditingController editmodspecialnoteController = TextEditingController();

// post
  addData(context) async {
    String apiUrl =
        'http://localhost/english_coach_php/modules/create_modules.php';
    var userdata = Modules(
        modNum: '',
        modOrder: modorderController.text,
        tNum: tnumController.text,
        modName: modnameController.text,
        modContent: modcontentController.text,
        modDescription: moddescriptionController.text,
        modSpecialnote: modspecialnoteController.text,
        modExampleExplanation: '');
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
    String getUrl =
        'http://localhost/english_coach_php/modules/read_modules.php';

    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<Modules>.from(
            jsonDecode(response.body).map((e) => Modules.fromJson(e))).toList();
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
        'http://localhost/english_coach_php/modules/update_modules.php?mod_num=$i');
    var data = Modules(
        modNum: editmodnumController.text.trim(),
        modOrder: editmodorderController.text.trim(),
        tNum: edittnumController.text.trim(),
        modName: editmodnameController.text.trim(),
        modContent: editmodcontentController.text.trim(),
        modDescription: editmoddescriptionController.text.trim(),
        modSpecialnote: editmodspecialnoteController.text.trim(),
        modExampleExplanation: '');

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
        'http://localhost/english_coach_php/modules/delete_modules.php?mod_num=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      snackbar(context, text: "deleted");
      getData();

      print('Successfully deleted');
    }
  }

  clear() {
    modorderController.clear();
    tnumController.clear();
    modnameController.clear();
    modcontentController.clear();
    moddescriptionController.clear();
    modspecialnoteController.clear();
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
