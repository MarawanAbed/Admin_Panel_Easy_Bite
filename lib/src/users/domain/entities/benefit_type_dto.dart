
import '../../data/models/benefit_type_dto.dart';

class BenefitType {
  int? id;
  String? name;

  BenefitType({this.id, this.name});

   factory BenefitType.fromDto(BenefitTypeDto json) {
     return BenefitType(
       id: json.id,
       name: json.name
     );
   }
}

