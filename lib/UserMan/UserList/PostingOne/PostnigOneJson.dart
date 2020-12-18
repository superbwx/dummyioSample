// To parse this JSON data, do
//
//     final postingOne = postingOneFromJson(jsonString);

import 'dart:convert';

PostingOneJson postingOneFromJson(String str) =>
    PostingOneJson.fromJson(json.decode(str));

String postingOneToJson(PostingOneJson data) => json.encode(data.toJson());

class PostingOneJson {
  PostingOneJson({
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
  dynamic link;
  int likes;

  factory PostingOneJson.fromJson(Map<String, dynamic> json) => PostingOneJson(
        owner: Owner.fromJson(json["owner"]),
        id: json["id"],
        image: json["image"],
        publishDate: DateTime.parse(json["publishDate"]),
        text: json["text"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        link: json["link"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "owner": owner.toJson(),
        "id": id,
        "image": image,
        "publishDate": publishDate.toIso8601String(),
        "text": text,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "link": link,
        "likes": likes,
      };
}

class Owner {
  Owner({
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

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
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
