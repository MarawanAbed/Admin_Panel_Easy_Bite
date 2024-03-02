import 'package:flutter/cupertino.dart';
import 'package:admin/src/benefits/presentation/pages/benefits_page.dart';

import '../../src/auth/presentation/pages/login/login_page.dart';
import '../../src/auth/presentation/sign-up/register_page.dart';
import '../../src/settings/presentation/pages/change-language/change_language_page.dart';


class Routes {

  static const String splashScreen = '/';
  static const String loginPage = 'login';
  static const String registerPage = 'register';
  static const String changeLanguagePage = 'changeLanguagePage';
  static const String profilePage = 'profilePage';
  static const String aboutUsPage = 'AboutUsPage';
  static const String mushafManagementPage = 'mushaf-management';
  static const String mushafPage = 'mushaf';
  static const String loginScreen = 'loginScreen';
  static const String quotationsPage = 'quotations';
  static const String quotationDetailsPage = 'quotationDetails';
  static const String readersPage = 'readersPage';
  static const String benefitsPage = 'benefitsPage';
  static const String myFilesPage = 'my-files';
  static const String fehresPage = 'fehres';
  static const String tafseerPage = 'tafseer';

  static const String onboardingPage = 'onboardingPage';
  static const String favoritesPage = 'favoritesPage';
  static const String ordersPage = 'OrdersPage';
  static const String communityPage = 'communityPage';
  static const String submitOrderPage = 'submitOrderPage';
  static const String orderDetailsPage = 'orderDetailsPage';
  static const String enterPhoneNumberPage = 'enterPhoneNumberPage';
  static const String enterPinCodePage = 'enterPinCodePage';
  static const String newPasswordPage = 'newPasswordPage';
  static const String navigationPages = 'navigationPages';
  static const String notifications = 'notifications';
  static const String tasks = 'tasks';
  static const String taskDetails = 'taskDetails';
  static const String shipmentsTabsPage = 'shipmentsTabsPage';
  static const String shipmentDetails = 'shipmentDetails';
  static const String support = 'support';
  static const String operations = 'operations';
  static const String productsPage = 'productsPage';
  static const String walletPage = 'wallet';
  static const String academy = 'academy';
  static const String settings = 'settings';
  static const String changeLanguage = 'changeLanguagePage';
  static const String aboutLogeste = 'aboutLogestePage';
  static const String homePage = 'homePage';
  static const String qrCodePage = 'QrCodePage';
  static const String complaintsDetailsPage = 'complaintsDetailsPage';
  static const String addComplaintPage = 'addComplaintPage';
  static const String captainsPage = 'captainsPage';
  static const String shipmentsCaptainTabsPage = 'shipmentsCaptainTabsPage';
  static const String orderDetailsCommentsPage = 'orderDetailsCommentsPage';

  /* ====================================================================== */
  static const String productDetailsPage = 'productDetailsPage';

  static final routes = <String, Widget Function(BuildContext)>{
    loginPage: (context) => LoginPage(),
    registerPage: (context) => RegisterPage(),
    changeLanguagePage: (context) => ChangeLanguagePage(),
  };
}
