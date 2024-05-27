// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;
import 'package:englishcoach/domain/model/modulesmodel.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UserproviderModules extends ChangeNotifier {
  List<Modules> _posts = [];
  List<Modules> get posts => _posts;
  bool isLoding = false;

  void reorderModules(List<Modules> updatedModules) async {
    try {
      String apiUrl =
          'http://localhost/english_coach_php/modules/update_order.php';
      var response = await http.put(
        Uri.parse(apiUrl),
        body: jsonEncode(updatedModules),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print('Reordered successfully');
        // Fetch updated data after reordering
        await getData();
      }
    } catch (e) {
      print('Error while reordering: ${e.toString()}');
    }
    notifyListeners();
  }

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

//count data
  getCount() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.muhammedhafiz.com/shalima/modules/module_count_select.php'));
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

  alertnew(context) {
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
    ); // That's it to display an alert, use other properties to customize.
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

// https://chat.openai.com/share/24bd9288-0e10-471f-ad7c-fec3f57d9d90

class CustomSnackbar extends StatelessWidget {
  final Widget content;

  CustomSnackbar({required this.content});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: content,
      ),
    );
  }
}
