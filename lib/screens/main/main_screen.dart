import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/src/categories/presentation/pages/categories_page.dart';
import 'package:admin/src/users/presentation/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../src/employees/presentation/pages/employees_page.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 6);
    List<Widget> children = [
      DashboardScreen(),
      CategoriesPage(),
      UsersPage(),
      UsersPage(),
      EmployeesPage(),
      UsersPage(),
      UsersPage(),
    ];
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(
        onNavigate: (index) {
          // _pageController.animateTo(index,
          //     duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          _pageController.jumpToPage(index.toInt());
        },
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                  onNavigate: (index) {
                    // _pageController.animateTo(index,
                    //     duration: Duration(milliseconds: 200),
                    //     curve: Curves.easeInOut);
                    _pageController.jumpToPage(index.toInt());
                  },
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: PageView.builder(
                itemCount: 7,
                controller: _pageController,
                itemBuilder: (context, index) => children[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
