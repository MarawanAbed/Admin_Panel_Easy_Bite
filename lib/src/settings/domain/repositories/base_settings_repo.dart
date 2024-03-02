
import '../../../../core/network/api_response.dart';
import '../../data/models/about_us_dto.dart';

abstract class BaseSettingsRepo {
  Future<AboutUsDto> fetchAboutUs();
  Future<AboutUsDto> fetchTermsAndConditions();
  Future<AboutUsDto> fetchPrivacy();
}
