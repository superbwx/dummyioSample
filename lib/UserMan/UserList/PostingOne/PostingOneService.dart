import 'package:http/http.dart' as http;
import '../constService.dart';
import 'PostnigOneJson.dart';

class PostingOneService {
  static Future<PostingOneJson> getPostingOne(idPosting) async {
    try {
      final response = await http.get(
        urlPostingOne + idPosting,
        headers: headers,
      );
      if (200 == response.statusCode) {
        final PostingOneJson idOnePosting = postingOneFromJson(response.body);
        return idOnePosting;
      } else {
        return PostingOneJson();
      }
    } catch (e) {
      return PostingOneJson();
    }
  }
}
