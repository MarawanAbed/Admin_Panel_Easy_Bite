// import 'package:flutter/material.dart';
// import 'package:admin/core/routes/route_path.dart';
//
//
//
// class AppRoute {
//   Route? generateRoute(RouteSettings settings) {
//     Map? arguments = settings.arguments as Map<String, dynamic>?;
//     switch (settings.name) {
//           case RoutePath.splashScreen:
//           return MaterialPageRoute(builder: (_) =>  SplashScreen());
//           case RoutePath.mushafManagementScreen:
//           return MaterialPageRoute(builder: (_) =>  MushafManagementScreen(fromProfile:arguments?['fromProfile'] ,myMushafNumber:arguments?['myMushafNumber'] ,));
//           case RoutePath.mushafScreen:
//           return MaterialPageRoute(builder: (_) =>  MushafScreen(mushafNumber: arguments?['mushafNumber'], mushafId: arguments?['mushafId']));
//           case RoutePath.registerScreen:
//           return MaterialPageRoute(builder: (_) => const RegisterScreen());
//           case RoutePath.loginScreen:
//           return MaterialPageRoute(builder: (_) => const LoginScreen());
//           case RoutePath.fehresScreen:
//           return MaterialPageRoute(builder: (_) => const FehresScreen());
//           case RoutePath.profileScreen:
//           return MaterialPageRoute(builder: (_) => const ProfileScreen());
//           case RoutePath.searchScreen:
//           return MaterialPageRoute(builder: (_) => const SearchScreen());
//           case RoutePath.myFilesScreen:
//           return MaterialPageRoute(builder: (_) => const MyFilesScreen(mushafId: 13,));
//           case RoutePath.readersScreen:
//           return MaterialPageRoute(builder: (_) => const ReadersScreenOld());
//           case RoutePath.benefitsScreen:
//           return MaterialPageRoute(builder: (_) => const BenefitsScreen());
//           case RoutePath.tafseerScreen:
//           return MaterialPageRoute(builder: (_) => const TafseerScreen());
//           case RoutePath.singleAyahTafseerScreen:
//           return MaterialPageRoute(builder: (_) => const SingleAyahTafseerScreen());
//           case RoutePath.dailyWerdScreen:
//           return MaterialPageRoute(builder: (_) => const DailyWerdScreen());
//           case RoutePath.qabsatScreen:
//           return MaterialPageRoute(builder: (_) =>  QabsatScreen(quotationsEntity: arguments?['quotation']));
//           case RoutePath.editProfile:
//           return MaterialPageRoute(builder: (_) =>  EditProfileScreen(userModel: arguments?['user_model'],));
//           case RoutePath.allQabsatScreen:
//           return MaterialPageRoute(builder: (_) =>   AllQabsatScreen(page: arguments?['page']));
//           case RoutePath.aboutUsScreen:
//           return MaterialPageRoute(builder: (_) => const AboutUsScreen());
//           case RoutePath.termsAndConditionsScreen:
//           return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());
//     }
//     return null;
//   }
// }
