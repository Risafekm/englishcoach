// ignore_for_file: prefer_const_constructors

import 'package:englishcoach/domain/Model/mod_user_authentication.dart';
import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

class UserproviderPassword extends ChangeNotifier {
  List<User> _posts = [];
  List<User> get posts => _posts;
  bool isLoding = false;
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

// update controller
  TextEditingController updatepasswordController = TextEditingController();
  // TextEditingController updateanswersController = TextEditingController();

  //update

  updateData(String i, context, String j) async {
    Uri updateUrl = Uri.parse(
        'http://localhost/english_coach_php/auth/update_admin_password.php?user_email=$i&user_pswd=$j');
    var data = User(
      userEmail: i,
      userPassword: j,
      newPassword: updatepasswordController.text,
    );

    try {
      var response = await http.put(
        updateUrl,
        body: jsonEncode(data.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // await getData();
        snackbar(context, text: "updated");
        print(" update success ${response.body}");
      }
    } catch (e) {
      print('Error updated failed: ${e.toString()}');
    }
    notifyListeners();
  }

  //post Data

  // Update the addData method in UserproviderPassword class
  Future<void> addData(
      String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      print('Email and password cannot be empty');
      return;
    }

    final apiUrl = Uri.parse(
        'http://localhost/english_coach_php/auth/user_authentication.php?user_email=$email&user_pswd=$password');
    final userData = Auth(
      userEmail: email,
      userPassword: password,
    );

    try {
      final response = await http.post(
        apiUrl,
        body: jsonEncode(userData.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final String responseBody = response.body;
        if (responseBody.isNotEmpty) {
          final data = jsonDecode(responseBody);
          if (data != null && data is Map<String, dynamic>) {
            if (data['status'] == 'success') {
              _isAuthenticated = true;
              snackbar(context, text: 'Logged In');
            } else {
              print('Authentication failed: ${data['message']}');
            }
          } else {
            print('Unexpected response format: $data');
          }
        } else {
          print('Empty response body');
        }
      } else {
        print('Failed to add data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error adding data: $e');
    }
    notifyListeners();
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
