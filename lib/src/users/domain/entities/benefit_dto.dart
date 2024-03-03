
import '../../data/models/benefit_dto.dart';
import 'benefit_type_dto.dart';

class Benefit {
  int? id;
  String? image;
  BenefitType? thread;

  Benefit({this.id, this.image, this.thread});

   factory Benefit.fromDto(BenefitDto json) {
      return Benefit(
        id: json.id,
        image: json.image,
        thread: BenefitType.fromDto(json.thread!)
      );
   }
}

