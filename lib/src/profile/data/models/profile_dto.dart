import 'package:json_annotation/json_annotation.dart'; 

part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProfileDto {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'isAdmin')
  bool? isAdmin;
  @JsonKey(name: 'isChef')
  bool? isChef;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  @JsonKey(name: 'accessToken')
  String? accessToken;

  ProfileDto({this.id, this.userName, this.email, this.isAdmin, this.isChef, this.createdAt, this.updatedAt, this.v, this.accessToken});

   factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}

