import 'package:admin/core/assets/app_icons.dart';
import 'package:admin/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  final Function(double) onNavigate;
  const SideMenu({
    Key? key,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: strings.dashboard,
            svgSrc: "assets/icons/menu_tran.svg",
            press: ()=> onNavigate(0),
          ),
          DrawerListTile(
            title: strings.categories,
            svgSrc: "assets/icons/category.svg",
            press: ()=> onNavigate(1),
          ),
          DrawerListTile(
            title: strings.products,
            svgSrc: "assets/icons/menu_task.svg",
            press: ()=> onNavigate(2),
              iconSize: 18,
          ),
          DrawerListTile(
            title: strings.jobs,
            svgSrc: "assets/icons/jobs.svg",
            press: ()=> onNavigate(3),
          ),
          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: ()=> onNavigate(4),
          // ),
          DrawerListTile(
            title: "Users",
            svgSrc: AppIcons.profileUserSVG,
            press: ()=> onNavigate(5),
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: ()=> onNavigate(6),
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: ()=> onNavigate(7),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    this.iconSize = 16,
    this.padding,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final double iconSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Padding(
        padding: padding ?? const EdgeInsets.only(right: 10),
        child: SvgPicture.asset(
          svgSrc,
          // colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
          color: Colors.white,
          height: iconSize,
          width: iconSize,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
