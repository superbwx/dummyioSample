import 'package:http/http.dart' as http;
import '../constService.dart';
import 'PostingListJson.dart';

class PostingListService {
  static Future<List<DataOwner>> getPosting() async {
    try {
      final response = await http.get(
        urlPostingList,
        headers: headers,
      );
      if (200 == response.statusCode) {
        final ListPostingJson list = listPostingFromJson(response.body);
        final List<DataOwner> dataOwner = list.data;
        return dataOwner;
      } else {
        return tempDataOwner();
      }
    } catch (e) {
      return tempDataOwner();
    }
  }

  static List<DataOwner> tempDataOwner() => [
        DataOwner(
          owner: Owner(
              id: "jpxJ6CnDgBUcqmMTczMh",
              email: "edina.barbosa@example.com",
              firstName: "Édina",
              title: "ms",
              lastName: "Barbosa",
              picture: "https://randomuser.me/api/portraits/women/28.jpg"),
          id: "randomId",
          image: "https://img.dummyapi.io/photo-1579562243430-4732bcb09d91.jpg",
          publishDate: null,
          text:
              "Milo durmiendo después de un largo día de jugar en el río brown short coated dog lying on white textile",
          tags: ["dog", "pet", "animal"],
          link: null,
          likes: 17,
        ),
        DataOwner(
          owner: Owner(
              id: "jpxJ6CnDgBUcqmMTczMh",
              email: "edina.barbosa@example.com",
              firstName: "Édina",
              title: "ms",
              lastName: "Barbosa",
              picture: "https://randomuser.me/api/portraits/women/28.jpg"),
          id: "randomId",
          image: "https://img.dummyapi.io/photo-1579562243430-4732bcb09d91.jpg",
          publishDate: null,
          text:
              "Milo durmiendo después de un largo día de jugar en el río brown short coated dog lying on white textile",
          tags: ["dog", "pet", "animal"],
          link: null,
          likes: 17,
        ),
        DataOwner(
          owner: Owner(
              id: "jpxJ6CnDgBUcqmMTczMh",
              email: "edina.barbosa@example.com",
              firstName: "Édina",
              title: "ms",
              lastName: "Barbosa",
              picture: "https://randomuser.me/api/portraits/women/28.jpg"),
          id: "randomId",
          image: "https://img.dummyapi.io/photo-1579562243430-4732bcb09d91.jpg",
          publishDate: null,
          text:
              "Milo durmiendo después de un largo día de jugar en el río brown short coated dog lying on white textile",
          tags: ["dog", "pet", "animal"],
          link: null,
          likes: 17,
        ),
        DataOwner(
          owner: Owner(
              id: "jpxJ6CnDgBUcqmMTczMh",
              email: "edina.barbosa@example.com",
              firstName: "Édina",
              title: "ms",
              lastName: "Barbosa",
              picture: "https://randomuser.me/api/portraits/women/28.jpg"),
          id: "randomId",
          image: "https://img.dummyapi.io/photo-1579562243430-4732bcb09d91.jpg",
          publishDate: null,
          text:
              "Milo durmiendo después de un largo día de jugar en el río brown short coated dog lying on white textile",
          tags: ["dog", "pet", "animal"],
          link: null,
          likes: 17,
        ),
        DataOwner(
          owner: Owner(
              id: "jpxJ6CnDgBUcqmMTczMh",
              email: "edina.barbosa@example.com",
              firstName: "Édina",
              title: "ms",
              lastName: "Barbosa",
              picture: "https://randomuser.me/api/portraits/women/28.jpg"),
          id: "randomId",
          image: "https://img.dummyapi.io/photo-1579562243430-4732bcb09d91.jpg",
          publishDate: null,
          text:
              "Milo durmiendo después de un largo día de jugar en el río brown short coated dog lying on white textile",
          tags: ["dog", "pet", "animal"],
          link: null,
          likes: 17,
        ),
      ];
}
