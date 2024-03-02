

import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';

class TabItemModel{
  final String label ;
  final Widget? page ;
  TabItemModel({required this.label, this.page});
  Tab builder(){
    return TabWidgetItemBuilder(this);
  }
}

class TabWidgetItemBuilder extends Tab{
  TabWidgetItemBuilder(TabItemModel model, {Key? key}):super(key: key, text: model.label);
}

class TabBarWidget  extends StatelessWidget{
  final Widget? page;
  final void Function(int)? onTap;
  final List<TabItemModel> tabs ;
  const TabBarWidget({Key? key ,required this.tabs, this.page, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: context.primaryColor,
            child: TabBar(
              indicatorColor: Colors.red,
         //   unselectedLabelStyle: kTextLabel,
            labelStyle: context.headlineSmall,
              labelColor: context.primaryColor,
              unselectedLabelColor: context.scaffoldBackgroundColor,
              // unselectedLabelColor:kPrimaryDark ,
              padding: 6.paddingBottom + 10.paddingHoriz,
              labelPadding: 0.paddingAll,
              dividerColor: context.primaryColor,
              indicator: BoxDecoration(
                  color: context.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs.map((e) => e.builder()).toList(),
            ),
          ),
        ),
        body:  TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabs.map((e) => Padding(
              padding: 10.paddingHoriz,
              child:  page ?? e.page)).toList(),
        ),
      ),
    );
  }

}
