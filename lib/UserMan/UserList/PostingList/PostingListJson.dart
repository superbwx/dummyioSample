// To parse this JSON data, do
//
//     final listPosting = listPostingFromJson(jsonString);

import 'dart:convert';

ListPostingJson listPostingFromJson(String str) =>
    ListPostingJson.fromJson(json.decode(str));

String listPostingToJson(ListPostingJson data) => json.encode(data.toJson());

class ListPostingJson {
  ListPostingJson({
    this.data,
    this.total,
    this.page,
    this.limit,
    this.offset,
  });

  List<DataOwner> data;
  int total;
  int page;
  int limit;
  int offset;

  factory ListPostingJson.fromJson(Map<String, dynamic> json) =>
      ListPostingJson(
        data: List<DataOwner>.from(
            json["data"].map((x) => DataOwner.fromJson(x))),
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

class DataOwner {
  DataOwner({
    this.owner,
    this.id,
    this.image,
    this.publishDate,
    this.text,
    this.tags,
    this.link,
    this.likes,
  });

  Owner owner;
  String id;
  String image;
  DateTime publishDate;
  String text;
  List<String> tags;
  String link;
  int likes;

  factory DataOwner.fromJson(Map<String, dynamic> json) => DataOwner(
        owner: Owner.fromJson(json["owner"]),
        id: json["id"],
        image: json["image"],
        publishDate: DateTime.parse(json["publishDate"]),
        text: json["text"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        link: json["link"] == null ? null : json["link"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "owner": owner.toJson(),
        "id": id,
        "image": image,
        "publishDate": publishDate.toIso8601String(),
        "text": text,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "link": link == null ? null : link,
        "likes": likes,
      };
}

class Owner {
  Owner({
    this.id,
    this.email,
    this.title,
    this.picture,
    this.firstName,
    this.lastName,
  });

  String id;
  String email;
  String title;
  String picture;
  String firstName;
  String lastName;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        email: json["email"],
        title: json["title"],
        picture: json["picture"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "title": title,
        "picture": picture,
        "firstName": firstName,
        "lastName": lastName,
      };
}
