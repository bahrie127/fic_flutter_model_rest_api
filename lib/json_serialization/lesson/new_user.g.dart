// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUser _$NewUserFromJson(Map<String, dynamic> json) => NewUser(
      json['name'] as String,
      json['email'] as String,
      json['address'] as String,
      json['registration_date_millis'] as int,
    );

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'registration_date_millis': instance.registrationDateMillis,
    };
