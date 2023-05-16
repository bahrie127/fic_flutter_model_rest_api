import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.name, this.email, this.registrationDateMillis);

  String name;
  String email;
  @JsonKey(name: 'registration_date_millis')
  final int registrationDateMillis;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
