import 'package:http/http.dart' as http;
import '../constService.dart';
import 'TagsJson.dart';

List<String> tagsJson;

class TagsService {
  static Future<List<String>> getTags() async {
    try {
      final response = await http.get(
        urlTagsList,
        headers: headers,
      );
      if (200 == response.statusCode) {
        final TagsJson tagsFromJson = tagsListFromJson(response.body);
        tagsJson = tagsFromJson.data;
        return tagsJson;
      } else {
        return tagsJson;
      }
    } catch (e) {
      return tagsJson;
    }
  }
}
