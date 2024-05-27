// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

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

//update

  final editquestionController = TextEditingController();
  final editanswersController = TextEditingController();
  final editoption1Controller = TextEditingController();
  final editoption2Controller = TextEditingController();
  final editoption3Controller = TextEditingController();

//post

  Future<void> addData(BuildContext context) async {
    String apiUrl = 'http://localhost/english_coach_php/mqc/createmqc.php';

    var userdata = {
      "questionData": {
        "trail_mcq_question": questionController.text,
        "trail_mcq_answer": answersController.text
      },
      "options": [
        option1Controller.text.toString(),
        option2Controller.text.toString(),
        option3Controller.text.toString(),
      ]
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
        await getData();
        print('Successfully posted');
        snackbar(context, text: "Added");
        var dataa = jsonDecode(response.body);
        print('Response body: $dataa');

        await getData();
        clear();
        notifyListeners();
      } else {
        // Request failed
        print('Failed to post data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        snackbar(context, text: "Failed");
        notifyListeners();
      }
    } catch (e) {
      // Error occurred during the request
      // print('Error: $e');
      // snackbar(context, text: "Catch error");
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

  //update data

  updateData(String i, context) async {
    Uri updateUrl = Uri.parse(
        'http://localhost/english_coach_php/mqc/updatemcq.php?question_id=$i');
    var data = {
      "questionId": i,
      "questionData": {
        "trail_mcq_question": editquestionController.text,
        "trail_mcq_answer": editanswersController.text,
      },
      "options": [
        editoption1Controller.text.toString(),
        editoption2Controller.text.toString(),
        editoption3Controller.text.toString(),
      ]
    };

    try {
      var response = await http.put(
        updateUrl,
        body: jsonEncode(data),
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
        'http://localhost/english_coach_php/mqc/deletemcq.php?question_id=$i');

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
