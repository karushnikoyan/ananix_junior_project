import 'package:json_annotation/json_annotation.dart';

part 'people_model.g.dart';

@JsonSerializable()
class People {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  People({this.id, this.name, this.email, this.gender, this.status});

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}

