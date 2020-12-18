// To parse this JSON data, do
//
//     final tagsList = tagsListFromJson(jsonString);

import 'dart:convert';

TagsJson tagsListFromJson(String str) => TagsJson.fromJson(json.decode(str));

String tagsListToJson(TagsJson data) => json.encode(data.toJson());

class TagsJson {
  TagsJson({
    this.data,
    this.total,
    this.page,
    this.limit,
    this.offset,
  });

  List<String> data;
  int total;
  int page;
  int limit;
  int offset;

  factory TagsJson.fromJson(Map<String, dynamic> json) => TagsJson(
        data: List<String>.from(json["data"].map((x) => x)),
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
        "total": total,
        "page": page,
        "limit": limit,
        "offset": offset,
      };
}
