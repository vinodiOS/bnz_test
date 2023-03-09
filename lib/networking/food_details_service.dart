import 'package:benzy_test/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../models/user_data_model.dart';
import 'dart:convert';

Future<FoodDetails> fetchData() async {
  try {
    Map<String, String> headers = {};
    headers["Content-Type"] =
        "application/x-www-form-urlencoded; charset=UTF-8";
    headers['Authorization'] = "Bearer $token";
    var data = {"month": 1};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent("$value")}');
    });
    var formData = parts.join('&');

    http.Response response =
        await http.post(Uri.parse(baseURL), headers: headers, body: formData);

    if (response.statusCode == 200) {
      Map<String, dynamic> results = json.decode(response.body);
      return FoodDetails.fromJson(results);
    } else {
      return throw ("Something went wrong");
    }
  } catch (e) {
    throw (e.toString());
  }
}
