// ignore_for_file: unnecessary_null_comparison
import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

class UserproviderTest extends ChangeNotifier {
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

  addData() async {
    String apiUrl = 'https://api.muhammedhafiz.com/risaf/test1/createtest1.php';
    var userdata = QuizTest1(
      topic_que_num: 0,
      topic_que_question: questionController.text.trim(),
      topic_ans_answer: answersController.text.trim(),
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
        getData();
        print('new data : $bodyy');
        clear();
        print('Response body: $dataa');
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      print('Error ${e.toString()}');
    }
    notifyListeners();
  }

  // Future<void> addData() async {
  //   String apiUrl = 'https://api.muhammedhafiz.com/risaf/test1/createtest1.php';
  //   var userdata = QuizTest1(
  //     topic_que_num: 0,
  //     topic_que_question: questionController.text.trim(),
  //     topic_ans_answer: answersController.text.trim(),
  //   );
  //   try {
  //     var bodyy = jsonEncode(userdata.toJson());
  //     var response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: bodyy,
  //       headers: {'Content-Type': 'application/json'},
  //     );

  //     if (response.statusCode == 201) {
  //       print('Successfully posted');
  //       var dataa = jsonDecode(response.body);
  //       print('Response body: $dataa');
  //       // Simulate a delay and handle timeout
  //       await Future.delayed(const Duration(seconds: 10), () {
  //         print('New data : $bodyy');
  //         notifyListeners();
  //         throw getData();

  //       });
  //     }
  //   } catch (e) {
  //     if (e is TimeoutException) {
  //       print('Operation timed out');
  //     } else {
  //       print('Error: ${e.toString()}');
  //     }
  //     notifyListeners();
  //   }
  //   notifyListeners();
  // }

//get Data

  getData() async {
    isLoding = true;
    String getUrl = 'https://api.muhammedhafiz.com/risaf/test1/readtest1.php';
    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<QuizTest1>.from(
                jsonDecode(response.body).map((e) => QuizTest1.fromJson(e)))
            .toList();
        if (data != null) {
          var dataa = jsonEncode(data);
          _posts = data;
          print(dataa);
          isLoding = false;
          notifyListeners();
        }
      }
    } catch (e) {
      print('Error ${e.toString()}');
    }
    notifyListeners();
  }

  //update

  updateData(int i, context) async {
    Uri updateUrl = Uri.parse(
        'https://api.muhammedhafiz.com/risaf/test1/updatetest1.php?topic_que_num=$i');
    var data = QuizTest1(
      topic_que_num: i,
      topic_que_question: updatequestionController.text.trim(),
      topic_ans_answer: updateanswersController.text.trim(),
    );

    try {
      var response = await http.put(
        updateUrl,
        body: jsonEncode(data.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        getData();
        clear();
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
        'https://api.muhammedhafiz.com/risaf/test1/deletetest1.php?topic_que_num=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      // snackbar(context, text: "deleted");
      getData();
      clear();
      print('Successfully deleted');
    }
  }

  clear() {
    questionController.clear();
    answersController.clear();
  }
}
