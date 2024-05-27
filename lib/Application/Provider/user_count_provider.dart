// ignore_for_file: prefer_const_constructors

import 'package:englishcoach/domain/export/export.dart';
import 'package:http/http.dart' as http;

class UserCountProvider extends ChangeNotifier {
//count data
  getCount() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.muhammedhafiz.com/rusafida/edu_user/read_user_count.php'));
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
}
