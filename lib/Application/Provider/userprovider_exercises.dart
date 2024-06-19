// ignore_for_file: unnecessary_null_comparison

import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

class UserProviderExercises extends ChangeNotifier {
  List<Exercises> _posts = [];
  List<Exercises> get posts => _posts;
  bool isLoding = false;

  // post controller
  TextEditingController modnumController = TextEditingController();
  TextEditingController quesController = TextEditingController();
  TextEditingController ansController = TextEditingController();

  //update Controller

  TextEditingController editExeNumController = TextEditingController();
  TextEditingController editModnumController = TextEditingController();
  TextEditingController editQuesController = TextEditingController();
  TextEditingController editAnsController = TextEditingController();

  //post Data

  addData(context) async {
    String apiUrl =
        'https://api.muhammedhafiz.com/risaf/module_Exercises/create_exercises.php';
    var userdata = Exercises(
      exeNum: '',
      modNum: modnumController.text,
      exeQuestion: quesController.text,
      exeAnswer: ansController.text,
      exeSentenceRule: '',
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
        // snackbar(context, text: "added");
        await getData();
        clear();
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
        'https://api.muhammedhafiz.com/risaf/module_Exercises/read_exercises.php';
    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<Exercises>.from(
                jsonDecode(response.body).map((e) => Exercises.fromJson(e)))
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
        'https://api.muhammedhafiz.com/risaf/module_Exercises/update_exercises.php?exe_num=$i');
    var data = Exercises(
      exeNum: i,
      modNum: editModnumController.text,
      exeQuestion: editQuesController.text,
      exeAnswer: editAnsController.text,
      exeSentenceRule: '',
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

  //delete

  deleteData(String i, context) async {
    Uri deleteUrl = Uri.parse(
        'https://api.muhammedhafiz.com/risaf/module_Exercises/delete_exercises.php?exe_num=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      // snackbar(context, text: "deleted");
      getData();

      print('Successfully deleted');
    }
  }

  clear() {
    quesController.clear();
    ansController.clear();
  }
}
