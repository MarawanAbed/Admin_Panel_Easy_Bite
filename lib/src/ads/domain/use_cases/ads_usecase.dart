import 'dart:io';

import 'package:admin/src/categories/data/models/category_dto.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/firebase/chat_firebase_service.dart';
import '../../data/data_sources/ads_datasource.dart';
import '../../data/models/ad_dto.dart';

@Injectable()
class AdsUseCase {
  final AdsDatasource  apiProvider;
  AdsUseCase(this.apiProvider);

  Future<List<AdDto>> fetchAds() async {
    return  await apiProvider.fetchAds();
  }

  Future<String> createAd(AdDto params) async {
    String file = await ChatFirebaseService.handleImage(
      params.id!,
      file: File(params.image!),
      image: params.image!,
    ) ?? '';
    params.image = file;
      await apiProvider.createAd(params);
    return 'Success create ad';
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deleteAd(id);
  }

  Future<String> updateUser(AdDto params) async {
    String file = await ChatFirebaseService.handleImage(
      params.id!,
      file: File(params.image!),
      image: params.image!,
    ) ?? '';
    params.image = file;
    await apiProvider.updateAd(params.id, params);
    return 'Success update ad';
  }


}