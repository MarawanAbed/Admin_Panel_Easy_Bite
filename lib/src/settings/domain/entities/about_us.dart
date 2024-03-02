
import '../../data/models/about_us_dto.dart';


class AboutUs {
  int? id;
  String? section;
  String? description;

  AboutUs({this.id, this.section});

   factory AboutUs.fromJson(AboutUsDto json){
     return AboutUs(
       id: json.id,
       section: json.section,
     );
   }
}

