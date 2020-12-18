// To parse this JSON data, do
//
//     final userOneJson = userOneJsonFromJson(jsonString);

import 'dart:convert';

UserOneJson userOneJsonFromJson(String str) =>
    UserOneJson.fromJson(json.decode(str));

String userOneJsonToJson(UserOneJson data) => json.encode(data.toJson());

class UserOneJson {
  UserOneJson({
    this.id,
    this.phone,
    this.lastName,
    this.firstName,
    this.location,
    this.email,
    this.gender,
    this.title,
    this.registerDate,
    this.picture,
    this.dateOfBirth,
  });

  String id;
  String phone;
  String lastName;
  String firstName;
  Location location;
  String email;
  String gender;
  String title;
  DateTime registerDate;
  String picture;
  DateTime dateOfBirth;

  factory UserOneJson.fromJson(Map<String, dynamic> json) => UserOneJson(
        id: json["id"],
        phone: json["phone"],
        lastName: json["lastName"],
        firstName: json["firstName"],
        location: Location.fromJson(json["location"]),
        email: json["email"],
        gender: json["gender"],
        title: json["title"],
        registerDate: DateTime.parse(json["registerDate"]),
        picture: json["picture"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "lastName": lastName,
        "firstName": firstName,
        "location": location.toJson(),
        "email": email,
        "gender": gender,
        "title": title,
        "registerDate": registerDate.toIso8601String(),
        "picture": picture,
        "dateOfBirth": dateOfBirth.toIso8601String(),
      };
}

class Location {
  Location({
    this.state,
    this.street,
    this.city,
    this.timezone,
    this.country,
  });

  String state;
  String street;
  String city;
  String timezone;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        state: json["state"],
        street: json["street"],
        city: json["city"],
        timezone: json["timezone"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "street": street,
        "city": city,
        "timezone": timezone,
        "country": country,
      };
}
