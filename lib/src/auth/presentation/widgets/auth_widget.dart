
import 'package:admin/core/widgets/buttons/app_icon.dart';

import '../../../../core/routes/navigator.dart';
import '../../../../core/utils/assets_manager.dart';
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
      decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
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
                AppIcon(
                  icon: AppIcons.logo,
                  size: 200,
                ),
              ],
            ),
            20.ph,
            child,
          ],
        ),
      ),
    );
  }
}
