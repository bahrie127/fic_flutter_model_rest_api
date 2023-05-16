import 'dart:convert';

import 'user.dart';

void main(List<String> args) {
  const String jsonString = """
{
    "name": "Rozak",
    "email": "rozak@jagoflutter.com",
    "registration_date_millis": 123232323231
}
""";
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);

  print('Halo, ${user.name}!');
  print('Email verification link: ${user.email}');

  String json = jsonEncode(user);

  print('String json: $json');
}
