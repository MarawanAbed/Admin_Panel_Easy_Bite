import 'package:json_annotation/json_annotation.dart'; 

part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProfileDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'access_token')
  String? accessToken;

  ProfileDto({this.id, this.name, this.lastName, this.phone, this.email, this.accessToken});

   factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}

