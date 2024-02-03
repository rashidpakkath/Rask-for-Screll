import 'package:flutter_project_test/model/freezed_model_class.dart';
import 'package:http/http.dart' as http;

class UserApiServices {
  static final http.Client client = http.Client();

  static Future<List<UserModel>?> getUsers() async {
    final urls = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      http.Response response = await client.get(urls);

      if (response.statusCode == 200) {
        return userModelFromJson(response.body);
      }
      return null;
    } catch (e) {}
    return null;
  }
}
