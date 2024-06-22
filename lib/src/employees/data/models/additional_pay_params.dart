import 'package:json_annotation/json_annotation.dart'; 

part 'additional_pay_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AdditionalPayParams {
  @JsonKey(name: "_id", includeIfNull: false, includeToJson: false)
  String? id;
  @JsonKey(name: 'additionalPay')
  int? additionalPay;

  AdditionalPayParams({this.additionalPay, this.id});

   factory AdditionalPayParams.fromJson(Map<String, dynamic> json) => _$AdditionalPayParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AdditionalPayParamsToJson(this);
}

