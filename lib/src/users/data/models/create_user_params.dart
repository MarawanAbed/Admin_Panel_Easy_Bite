import 'package:json_annotation/json_annotation.dart'; 

part 'create_user_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CreateUserParams {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'is_admin')
  bool? isAdmin;
  @JsonKey(name: 'image')
  String? image;

  CreateUserParams({this.id, this.userName, this.email, this.password, this.isAdmin, this.image});

   factory CreateUserParams.fromJson(Map<String, dynamic> json) => _$CreateUserParamsFromJson(json);

   Map<String, dynamic> toJson() => _$CreateUserParamsToJson(this);
}

