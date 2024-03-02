import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_benefits_repo.dart';
import '../data_sources/benefits_datasource.dart';
import '../models/benefit_dto.dart';
import '../models/benefit_type_dto.dart';

@Injectable(as: BaseBenefitsRepo)
class BenefitsRepo extends BaseBenefitsRepo{
  final BenefitsDatasource  apiProvider;
  BenefitsRepo(this.apiProvider);


  @override
  Future<List<BenefitTypeDto>> fetchBenefitsTypes() async{
    final data = await apiProvider.fetchBenefitsTypes();
    return data.data ?? [];
  }

  @override
  Future<List<BenefitDto>> fetchBenefits() async{
    final data = await apiProvider.fetchBenefits();
    return data.data ?? [];
  }

}