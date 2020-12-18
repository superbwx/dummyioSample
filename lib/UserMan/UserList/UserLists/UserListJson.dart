// To parse this JSON data, do
//
//     final userDummy = userDummyFromJson(jsonString);

import 'dart:convert';

UserDummy userDummyFromJson(String str) => UserDummy.fromJson(json.decode(str));

String userDummyToJson(UserDummy data) => json.encode(data.toJson());

class UserDummy {
  UserDummy({
    this.data,
    this.total,
    this.page,
    this.limit,
    this.offset,
  });

  List<Usernya> data;
  int total;
  int page;
  int limit;
  int offset;

  factory UserDummy.fromJson(Map<String, dynamic> json) => UserDummy(
        data: List<Usernya>.from(json["data"].map((x) => Usernya.fromJson(x))),
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
        "page": page,
        "limit": limit,
        "offset": offset,
      };
}

class Usernya {
  Usernya({
    this.id,
    this.lastName,
    this.firstName,
    this.email,
    this.title,
    this.picture,
  });

  String id;
  String lastName;
  String firstName;
  String email;
  String title;
  String picture;

  factory Usernya.fromJson(Map<String, dynamic> json) => Usernya(
        id: json["id"],
        lastName: json["lastName"],
        firstName: json["firstName"],
        email: json["email"],
        title: json["title"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lastName": lastName,
        "firstName": firstName,
        "email": email,
        "title": title,
        "picture": picture,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
