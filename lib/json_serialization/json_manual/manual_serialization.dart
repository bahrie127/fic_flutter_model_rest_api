import 'dart:convert';

void main(List<String> args) {
  const String jsonString = """
{
    "name": "Sabrina",
    "email": "sabrina@binar.co.id"
}
""";
  Map<String, dynamic> user = jsonDecode(jsonString);

  print('Halo, ${user['name']}!');
  print('Email verification : ${user['email']}');
  
}
