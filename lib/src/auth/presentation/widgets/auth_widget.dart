import 'package:flutter/foundation.dart';

import '../../../../core/routes/navigator.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../main_index.dart';

class AuthWidget extends BaseStatelessWidget {
  final Widget child;
  final bool isLogin;

   AuthWidget({super.key, required this.child, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: ColorsManager.offWhiteColorF9F0E1,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsManager.appBackGroundLogo))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.ph,
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const AppIcon(
                    size: 240,
                    icon: AssetsManager.circleBorderSVG),
                Image.asset(
                  AssetsManager.logo,
                  height: 170,
                  width: 180,
                ),
              ],
            ),
            20.ph,
            child,
            Row(
              children: [
                const Spacer(),
                Text(
                  isLogin ? strings.dont_have_an_account : strings.already_have_an_account,
                ),
                5.pw,

                GestureDetector(
                  onTap: () => isLogin ? pushNamed(Routes.registerPage) : pop(),
                  child: Text(
                      isLogin ? strings.create_account : strings.login,
                      style: context.headlineLarge
                  ),
                ),
                const Spacer(),
              ],
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}
