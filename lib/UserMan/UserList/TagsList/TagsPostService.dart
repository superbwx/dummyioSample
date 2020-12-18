import 'package:http/http.dart' as http;
import 'package:usermann/UserMan/UserList/PostingList/PostingListJson.dart';
import '../constService.dart';

List<DataOwner> dataOwner;

class TagsPostService {
  static Future<List<DataOwner>> getIdTag(idTag) async {
    try {
      final response = await http.get(
        urlTagsList + "/" + idTag + "/post",
        headers: headers,
      );
      if (200 == response.statusCode) {
        final ListPostingJson list = listPostingFromJson(response.body);
        List<DataOwner> dataOwner = list.data;
        return dataOwner;
      } else {
        return dataOwner;
      }
    } catch (e) {
      return dataOwner;
    }
  }
}
