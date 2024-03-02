import 'package:admin/core/routes/route_path.dart';
import 'package:admin/src/main_index.dart';
import 'package:admin/src/profile/widget/profile_header_widget.dart';
import 'package:admin/src/profile/widget/profile_item_widget.dart';

import '../../core/routes/navigator.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/colors_manager.dart';
import '../../core/utils/screen_sizer.dart';
import '../../src/settings/domain/entities/about_us_types_.dart';
import '../../src/settings/presentation/widgets/dark_mode_button.dart';
import '../settings/presentation/widgets/profile_switch_item_widget.dart';
class ProfileScreen extends BaseStatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeaderWidget(),
              DarkModeButton(),
              // WakelockScreenButton(),

              // const ProfileSwitchItemWidget(
              //   title: "إغلاق الشاشة عند التوقف عن القراءة",
              //   hint: 'غير مفعل',
              //   icon: AssetsManager.phoneLockedSVG,
              //   switchValue: false,
              // ),
              // const ProfileSwitchItemWidget(
              //   title: "سماح التحميل على الشبكة الخلوية",
              //   hint: 'غير مفعل',
              //   icon: AssetsManager.networkSVG,
              //   switchValue: false,
              // ),
              // const ProfileSwitchItemWidget(
              //   title: "تصفح عن طريق مفاتيح الصوت",
              //   hint: 'مفعل',
              //   icon: AssetsManager.listOfLinesSVG,
              //   switchValue: true,
              // ),
              const ProfileSwitchItemWidget(
                title: "تعليم المفضلة",
                hint: 'مفعل',
                icon: AssetsManager.starNotFilledSVG,
                switchValue: true,
              ),
              const ProfileSwitchItemWidget(
                title: "تعليم الملاحظات",
                hint: 'غير مفعل',
                icon: AssetsManager.fileSVG,
                switchValue: false,
              ),
              // const ProfileSwitchItemWidget(
              //   title: "عرض الجزر مع المعني",
              //   hint: 'مفعل',
              //   icon: AssetsManager.rootMeanSVG,
              //   switchValue: true,
              // ),
              // const ProfileSwitchItemWidget(
              //   title: "عرض الجزر فقط",
              //   hint: 'غير مفعل',
              //   icon: AssetsManager.onlyRootSVG,
              //   switchValue: false,
              // ),
              // const Divider(height: 20),
              // ProfileItemWidget(
              //   title: context.strings.quotations,
              //   icon: AssetsManager.aboutUsSVG,
              //   function: () => pushNamed(Routes.quotationsPage),
              // ),
              // const Divider(height: 5),
              // ProfileItemWidget(
              //   title: context.strings.benefits,
              //   icon: AssetsManager.aboutUsSVG,
              //   function: () => pushNamed(RoutePath.benefitsScreen),
              // ),
              20.ph,
              const Divider(height: 5),
              ProfileItemWidget(
                title: context.strings.readers,
                icon: AssetsManager.aboutUsSVG,
                function: () => pushNamed(Routes.readersPage),
              ),
              const Divider(height: 5),
              ProfileItemWidget(
                title: context.strings.who_are_we,
                icon: AssetsManager.aboutUsSVG,
                function: () => pushNamed(Routes.aboutUsPage, arguments: AboutUsTypes.ABOUT_US),
              ),
              const Divider(height: 5),
              ProfileItemWidget(
                title: context.strings.terms_and_conditions,
                icon: AssetsManager.termsSVG,
                function: () => pushNamed(Routes.aboutUsPage, arguments: AboutUsTypes.TERMS_AND_CONDITIONS),
              ),
              const Divider(height: 5),
              ProfileItemWidget(
                title: "اللغة",
                hint: context.languageName,
                icon: AssetsManager.languageSVG,
                function: () {
                  pushNamed(Routes.changeLanguagePage);
                },
              ),
              const Divider(height: 5),
              ProfileItemWidget(
                title: "إدارة المصاحف",
                // hint: MySharedPreference.getData(key: "hasMushaf"),
                icon: AssetsManager.profileBookSVG,
                function: () {
                  pushNamed(Routes.mushafManagementPage);
                },
                // function: ,
              ),
              const Divider(height: 5),
              ProfileItemWidget(
                title: "الورد اليومي",
                hint: 'ختمة رمضان',
                icon: AssetsManager.profileAyahSVG,
                function: () {},
              ),
              const Divider(height: 5),
              // ProfileItemWidget(
              //     title: "إعدادات التلاوة",
              //     hint: 'الشيخ محمد ايوب',
              //     icon: AssetsManager.infoSVG),
              // Divider(),
              // ProfileItemWidget(
              //     title: "جودة الصوت",
              //     hint: 'عالية',
              //     icon: AssetsManager.headSetSVG),
              // Divider(),
              ProfileItemWidget(
                title: "مكان التطبيق",
                hint: 'ذاكرة الجهاز',
                icon: AssetsManager.dataBaseSVG,
                function: () {},
              ),
              const SizedBox(
                height: 4,
              )
            ],
          ),
        ),
       20.ph,
        Center(
          child: Text(
            "الاصدار 1.0.0",
            style: bodyMedium,

          ),
        ),
        8.ph,
      ],
    );
  }
}
