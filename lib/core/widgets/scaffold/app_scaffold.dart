import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin/core/extensions/extensions.dart';
import 'package:admin/core/widgets/buttons/app_icon_button.dart';

import '../../../src/profile/profile_screen.dart';
import '../../utils/assets_manager.dart';
import '../tabview/tabbar_widget.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget body;
  final Widget? floatingActionButton;
  final bool? isDrawer;
  final PreferredSizeWidget? appBar;
  final Color? backgroundAppBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? resizeToAvoidBottomInset;
  final List<TabItemModel>? tabs;
  final void Function(int)? onTap;

  const AppScaffold({
    Key? key,
    this.title,
    required this.body,
    this.floatingActionButton,
    this.isDrawer = true,
    this.appBar,
    this.backgroundAppBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.actions,
    this.titleStyle,
    this.foregroundColor,
    this.leading,
    this.resizeToAvoidBottomInset,
    this.tabs,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('resizeToAvoidBottomInset: $resizeToAvoidBottomInset ');
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      // this code remove the keyboard overflow.
      drawer: kIsWeb ? Drawer(child: ProfileScreen(),) : null,
      //SafeArea to save content from the phone top par.
      body:  tabs == null
          ? body
          : TabBarWidget(
        tabs: tabs!,
        page: body,
        onTap: onTap,
      ),
      // extendBody: true,
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      appBar: (title == null && appBar == null)
          ? null
          : appBar ??
              AppBar(
                title: Text(title ?? '',
                    style: titleStyle ?? theme.appBarTheme.titleTextStyle),
                centerTitle: kIsWeb ? false : true,
                backgroundColor:
                    backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                foregroundColor:
                    foregroundColor ?? theme.appBarTheme.foregroundColor,
                actions: actions ?? [],
                leading: leading ?? (kIsWeb ? null: Navigator.canPop(context) ? AppIconButton(
                  icon: AssetsManager.arrowSVG,
                padding: 12.paddingAll,
                  onPressed: () => Navigator.pop(context),
                ) : const SizedBox.shrink()),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:
                      backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                  statusBarBrightness: Brightness.light,
                ),
              ),
    );
  }
}
