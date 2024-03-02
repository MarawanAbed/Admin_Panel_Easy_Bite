// import 'package:flutter/material.dart';
//
// import '../../../data/model/base/response_model.dart';
// import '../../../data/model/user_model.dart';
// import '../../../domain/usecase/local/clear_user_data_usecase.dart';
// import '../../../domain/usecase/local/get_is_login_usecase.dart';
// import '../../../domain/usecase/local/get_user_data_usecase.dart';
//
//
// class LocalAuthProvider with ChangeNotifier {
//
//   final GetIsUserLoginUseCase getIsUserLoginUseCase;
//   final GetUserDataUseCase getUserDataUseCase;
//   final ClearUserDataUseCase clearUserDataUseCase;
//
//   LocalAuthProvider(
//       {required this.getIsUserLoginUseCase,
//       required this.getUserDataUseCase,
//       required this.clearUserDataUseCase,
//       });
//
//   UserModel? _user ;
//
//   UserModel? get user => _user;
// bool isLoginUser = false;
//   Future<bool> isLogin() async {
//     ResponseModel responseModel = await getIsUserLoginUseCase.call();
//     if (responseModel.isSuccess) {
//       isLoginUser = await getSavedUserData();
//     } else {}
//     return responseModel.isSuccess;
//   }
//
//
//   Future<bool> getSavedUserData() async {
//     ResponseModel responseModel = await getUserDataUseCase.call();
//     if (responseModel.isSuccess) {
//       _user = responseModel.data;
//       debugPrint("UserSavedData ${_user}");
//     }
//     notifyListeners();
//     return responseModel.isSuccess;
//   }
//
//   Future logOut({
//     required BuildContext context,
//   }) async {
//     _user= null;
//     await clearUserDataUseCase.call();
//   }
// }
