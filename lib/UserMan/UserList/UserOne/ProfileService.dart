import 'package:http/http.dart' as http;
import 'package:usermann/UserMan/UserList/UserOne/UserProfileJson.dart';
import '../constService.dart';

class ProfileService {
  static Future<UserOneJson> getUsers(idUser) async {
    try {
      final response = await http.get(
        masterUrl + 'user/' + idUser,
        headers: headers,
      );
      if (200 == response.statusCode) {
        final UserOneJson userOneJson = userOneJsonFromJson(response.body);
        return userOneJson;
      } else {
        return UserOneJson();
      }
    } catch (e) {
      return UserOneJson();
    }
  }
}
