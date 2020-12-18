import 'package:http/http.dart' as http;
import '../constService.dart';
import 'UserListJson.dart';

class DummyService {
  //UserDummy users;

  static Future<List<Usernya>> getUsers() async {
    try {
      final response = await http.get(
        masterUrl + 'user?limit=10',
        headers: headers,
      );
      if (200 == response.statusCode) {
        final UserDummy userss = userDummyFromJson(response.body);
        final List<Usernya> users = userss.data;
        return users;
      } else {
        return tempUsernya();
      }
    } catch (e) {
      return tempUsernya();
    }
  }

  static List<Usernya> tempUsernya() => [
        Usernya(
            id: "0F8JIqi4zwvb77FGz6Wt",
            lastName: "Fiedler",
            firstName: "Heinz-Georg",
            email: "heinz-georg.fiedler@example.com",
            title: "mr",
            picture: "https://randomuser.me/api/portraits/men/81.jpg"),
        Usernya(
            id: "0F8JIqi4zwvb77FGz6Wt",
            lastName: "Fiedler",
            firstName: "Heinz-Georg",
            email: "heinz-georg.fiedler@example.com",
            title: "mr",
            picture: "https://randomuser.me/api/portraits/men/81.jpg"),
        Usernya(
            id: "0F8JIqi4zwvb77FGz6Wt",
            lastName: "Fiedler",
            firstName: "Heinz-Georg",
            email: "heinz-georg.fiedler@example.com",
            title: "mr",
            picture: "https://randomuser.me/api/portraits/men/81.jpg"),
        Usernya(
            id: "0F8JIqi4zwvb77FGz6Wt",
            lastName: "Fiedler",
            firstName: "Heinz-Georg",
            email: "heinz-georg.fiedler@example.com",
            title: "mr",
            picture: "https://randomuser.me/api/portraits/men/81.jpg"),
      ];
}
