
import '../../data/models/profile_dto.dart';

class Profile {
  int? id;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? accessToken;

  Profile({this.id, this.name, this.lastName, this.phone, this.email, this.accessToken});

   factory Profile.fromDto(ProfileDto json) => Profile(
    id: json.id,
    name: json.name,
    lastName: json.lastName,
    phone: json.phone,
    email: json.email,
    accessToken: json.accessToken,
  );
}

