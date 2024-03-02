
import '../../data/models/benefit_dto.dart';
import '../../data/models/benefit_type_dto.dart';

abstract class BaseBenefitsRepo {
  Future<List<BenefitTypeDto>> fetchBenefitsTypes();
  Future<List<BenefitDto>> fetchBenefits();
}
