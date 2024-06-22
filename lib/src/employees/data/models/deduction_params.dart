import 'package:json_annotation/json_annotation.dart'; 

part 'deduction_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class DeductionParams {
  @JsonKey(name: "_id", includeIfNull: false, includeToJson: false)
  String? id;
  @JsonKey(name: 'deduction')
  int? deduction;

  DeductionParams({this.deduction, this.id});

   factory DeductionParams.fromJson(Map<String, dynamic> json) => _$DeductionParamsFromJson(json);

   Map<String, dynamic> toJson() => _$DeductionParamsToJson(this);
}

