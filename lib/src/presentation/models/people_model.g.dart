// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['gender'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'status': instance.status,
    };
