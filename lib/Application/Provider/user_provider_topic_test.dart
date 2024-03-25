// ignore_for_file: unnecessary_null_comparison
import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

class UserproviderTopicTest extends ChangeNotifier {
  List<TopicTest> _posts = [];
  List<TopicTest> get posts => _posts;
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
        'http://localhost/english_coach_php/topic_test/createtopictest.php';
    var userdata = TopicTest(
      topicQueNum: '',
      topicAnsAnswer: answersController.text,
      topicQueQuestion: questionController.text,
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
    String getUrl =
        'http://localhost/english_coach_php/topic_test/readtopictest.php';

    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<TopicTest>.from(
                jsonDecode(response.body).map((e) => TopicTest.fromJson(e)))
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
        'http://localhost/english_coach_php/topic_test/updatetopictest.php?topic_que_num=$i');
    var data = TopicTest(
      topicQueNum: i,
      topicAnsAnswer: updateanswersController.text,
      topicQueQuestion: updatequestionController.text,
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

  deleteData(String i, context) async {
    Uri deleteUrl = Uri.parse(
        'http://localhost/english_coach_php/topic_test/deletetopictest.php?topic_que_num=$i');

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
