import 'dart:convert';

import 'package:flutter/foundation.dart';

Future<List<CookResponse>> cookResponseFromJsonIsolate(String str) async{
  await compute(cookResponseFromJson,str);
}

List<CookResponse> cookResponseFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<CookResponse>.from(jsonData.map((x) => CookResponse.fromJson(x)));
}

String cookResponseToJson(List<CookResponse> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class CookResponse {
    String cookName;
    Gender gender;
    int experience;
    String language;
    int perMonthCharge;
    double rating;

    CookResponse({
        this.cookName,
        this.gender,
        this.experience,
        this.language,
        this.perMonthCharge,
        this.rating,
    });
  
    factory CookResponse.fromJson(Map<String, dynamic> json) => new CookResponse(
        cookName: json["cookName"],
        gender: genderValues.map[json["gender"]],
        experience: json["experience"],
        language: json["language"],
        perMonthCharge: json["perMonthCharge"],
        rating: json["rating"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "cookName": cookName,
        "gender": genderValues.reverse[gender],
        "experience": experience,
        "language": language,
        "perMonthCharge": perMonthCharge,
        "rating": rating,
    };
}

enum Gender { MALE, FEMALE }

final genderValues = new EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE
});

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
