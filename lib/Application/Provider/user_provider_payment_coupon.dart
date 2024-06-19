// ignore_for_file: unnecessary_null_comparison
import 'package:englishcoach/domain/export/export.dart';
import 'package:englishcoach/domain/model/coupon_model.dart';
import 'package:http/http.dart' as http;

class UserproviderCoupon extends ChangeNotifier {
  List<Coupon> _posts = [];
  List<Coupon> get posts => _posts;
  bool isLoding = false;
// post controller
  TextEditingController couponNameController = TextEditingController();
  TextEditingController couponReductionController = TextEditingController();
  TextEditingController couponCountController = TextEditingController();

// update controller
  TextEditingController updateCouponNameController = TextEditingController();
  TextEditingController updateCouponReductionController =
      TextEditingController();
  TextEditingController updateCouponCountController = TextEditingController();

// post

  addData() async {
    String apiUrl =
        'https://api.muhammedhafiz.com/risaf/coupon/create_coupon.php';
    var userdata = Coupon(
        couponId: "",
        couponName: couponNameController.text,
        couponReduction: couponReductionController.text,
        couponCount: couponCountController.text);
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

//get Data

  getData() async {
    isLoding = true;
    String getUrl =
        'https://api.muhammedhafiz.com/risaf/coupon/read_coupon.php';
    try {
      var response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        var data = List<Coupon>.from(
            jsonDecode(response.body).map((e) => Coupon.fromJson(e))).toList();
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

  updateData(String i, context) async {
    Uri updateUrl = Uri.parse(
        'https://api.muhammedhafiz.com/risaf/coupon/update_coupon.php?coupon_id=$i');
    var data = Coupon(
        couponId: i,
        couponName: updateCouponNameController.text,
        couponReduction: updateCouponReductionController.text,
        couponCount: updateCouponCountController.text);
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
        'https://api.muhammedhafiz.com/risaf/test1/delete_coupon.php?coupon_id=$i');

    var response = await http.delete(deleteUrl);
    if (response.statusCode == 200) {
      // snackbar(context, text: "deleted");
      getData();
      clear();
      print('Successfully deleted');
    }
  }

  clear() {
    couponCountController.clear();
    couponNameController.clear();
    couponReductionController.clear();
  }
}
