// ignore_for_file: unnecessary_null_comparison, unused_local_variable, prefer_const_constructors
import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

class UserProviderTrail extends ChangeNotifier {
  List<TrailModules> _posts = [];
  List<TrailModules> get posts => _posts;
  bool isLoding = false;

// post controller
  TextEditingController modorderController = TextEditingController();
  TextEditingController modnameController = TextEditingController();
  TextEditingController modcontentController = TextEditingController();
  TextEditingController moddescriptionController = TextEditingController();
  TextEditingController modspecialnoteController = TextEditingController();

// update controller
  TextEditingController editmodnameController = TextEditingController();
  TextEditingController editmodcontentController = TextEditingController();
  TextEditingController editmodorderController = TextEditingController();
  TextEditingController editmoddescriptionController = TextEditingController();
  TextEditingController editmodspecialnoteController = TextEditingController();

// post
  addData(context) async {
    String apiUrl =
        'http://localhost/english_coach_php/trail_modules/create_trail_modules.php';
    var userdata = TrailModules(
        modNum: '',
        modOrder: modorderController.text,
        tNum: '0',
        modName: modnameController.text,
        modContent: modcontentController.text,
        modDescription: moddescriptionController.text,
        modSpecialnote: modspecialnoteController.text,
        modExampleExplanation: '0',
        slLevel: 'b');
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

  // get count
  getCount() async {
    try {
      final response = await http.get(Uri.parse(
          'http://localhost/php_practice/new_php/trail_mcq_question/module%20folder/trial_slect.php'));
      final jsonData = json.decode(response.body);
      print('Received JSON data: $jsonData');

      if (jsonData is int) {
        return jsonData;
      } else {
        throw FormatException(
            'Unexpected format of count data: Expected an integer.');
      }
    } catch (e) {
      print('Error fetching count: $e');
      rethrow;
    }
  }

//get Data

  getData() async {
    isLoding = true;
    String getUrl =
        'http://localhost/english_coach_php/trail_modules/read_trail_modules.php';
    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<TrailModules>.from(
                jsonDecode(response.body).map((e) => TrailModules.fromJson(e)))
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
        'http://localhost/english_coach_php/trail_modules/update_trail_modules.php?mod_num=$i');
    var data = TrailModules(
        modNum: '',
        modOrder: editmodorderController.text.trim(),
        tNum: '0',
        modName: editmodnameController.text.trim(),
        modContent: editmodcontentController.text.trim(),
        modDescription: editmoddescriptionController.text.trim(),
        modSpecialnote: editmodspecialnoteController.text.trim(),
        modExampleExplanation: '0',
        slLevel: 'b');

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
        'http://localhost/english_coach_php/trail_modules/delete_trail_modules.php?mod_num=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      snackbar(context, text: "deleted");
      getData();

      print('Successfully deleted');
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
