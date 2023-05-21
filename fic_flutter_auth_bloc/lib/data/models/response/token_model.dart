import 'package:meta/meta.dart';
import 'dart:convert';

Tokenmodel tokenmodelFromJson(String str) =>
    Tokenmodel.fromJson(json.decode(str));

String tokenmodelToJson(Tokenmodel data) => json.encode(data.toJson());

class Tokenmodel {
  final String accessToken;
  final String refreshToken;

  Tokenmodel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokenmodel.fromJson(Map<String, dynamic> json) => Tokenmodel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
