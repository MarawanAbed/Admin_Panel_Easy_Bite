import 'package:injectable/injectable.dart';

import '../entities/benefit_dto.dart';
import '../entities/benefit_type_dto.dart';
import '../repositories/base_benefits_repo.dart';

@Injectable()
class BenefitsUseCase {
 BaseBenefitsRepo repository ;
  BenefitsUseCase(this.repository);

  Future<List<BenefitType>> fetchBenefitsTypes() async {
    final data =  await repository.fetchBenefitsTypes();
    return data.map((e) => BenefitType.fromDto(e)).toList();
  }

  Future<List<Benefit>> fetchBenefits() async {
    final data =  await repository.fetchBenefits();
    return data.map((e) => Benefit.fromDto(e)).toList();
  }


}