import 'package:admin/core/theme/light_theme.dart';
import 'package:admin/src/main_index.dart';

import '../../../responsive.dart';

class SideMenu extends StatelessWidget {
  final Function(double) onNavigate;

  const SideMenu({
    Key? key,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SideMenu build');
    final strings = context.strings;
    bool isMobile = Responsive.isDesktop(context);
    return Drawer(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 10,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        children: [
          const DrawerHeader(
            child: AppIcon(icon: "assets/logo/full_logo.svg"),
          ),
          DrawerListTile(
            title: strings.dashboard,
            svgSrc: "assets/icons/menu_tran.svg",
            press: () => onNavigate(0),
            isIcon: isMobile,
          ),
          DrawerListTile(
            title: strings.categories,
            svgSrc: "assets/icons/category.svg",
            press: () => onNavigate(1),
            isIcon: isMobile,
          ),
          DrawerListTile(
            title: strings.products,
            svgSrc: "assets/icons/menu_task.svg",
            press: () => onNavigate(2),
            iconSize: 18,
            isIcon: isMobile,
          ),
          DrawerListTile(
            title: strings.jobs,
            svgSrc: "assets/icons/jobs.svg",
            press: () => onNavigate(3),
            isIcon: isMobile,
          ),
          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: ()=> onNavigate(4),
          // ),
          DrawerListTile(
            title: strings.employees,
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => onNavigate(4),
            isIcon: isMobile,
          ),
          DrawerListTile(
            title: strings.users,
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => onNavigate(5),
            isIcon: isMobile,
          ),
          DrawerListTile(
            title: strings.settings,
            svgSrc: "assets/icons/menu_setting.svg",
            press: () => onNavigate(6),
            isIcon: isMobile,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, svgSrc;
  final VoidCallback press;
  final double iconSize;
  final EdgeInsetsGeometry? padding;
  final bool isIcon;

  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    this.iconSize = 20,
    this.padding,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            10.pw,
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                svgSrc,
                // colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
                color: primaryColor,

                height: iconSize,
                width: iconSize,
              ),
            ),
            if (isIcon) ...[
              10.pw,
              Expanded(
                flex: 5,
                // fit: BoxFit.scaleDown,
                // alignment: AlignmentDirectional.centerStart,
                child: Text(
                  title,
                  // style: TextStyle(color: Colors.white54),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
