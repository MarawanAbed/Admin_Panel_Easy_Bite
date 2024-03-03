import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';
import 'custom_radio_list.dart';


///  Created by harbey on 7/11/2023.
class RadioSelectionList extends BaseStatelessWidget {
  final List<RadioItem> items;
  final String? groupValue;
  final Color? color;
  final int crossAxisCount;
  final void Function(RadioItem)? onChanged;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final bool isGrid;
  RadioSelectionList({
    Key? key,
    required this.items,
    this.color,
     this.groupValue,
    required this.onChanged,
    this.crossAxisCount = 2,
    this.itemBuilder,
    this.isGrid = false,
  });
  @override
  Widget build(BuildContext context) {
    String groupValue = this.groupValue ?? (items.isNotEmpty ? items.first.value : '');
    return StatefulBuilder(builder: (context, setState) {
      return isGrid ? GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3.0,
          ),
          itemBuilder: (context, index) {
            return CustomRadioList(
              title: items[index].title,
              color: color,
              value: items[index].value,
              groupValue: groupValue,
                subTitle: items[index].subTitle,
              textWidget: itemBuilder != null ? itemBuilder!(context, index) : null,
              onChanged: (value) {
                groupValue = value as String;
                onChanged!(items[index]);
                setState(() {});
              },
            );
          }) :
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomRadioList(
              title: items[index].title,
              color: color,
              value: items[index].value,
              groupValue: groupValue,
              subTitle: items[index].subTitle,
                textWidget: itemBuilder != null ? itemBuilder!(context, index) : null,
              onChanged: (value) {
                groupValue = value as String;
                onChanged!(items[index]);
                setState(() {});
              },
            );
          });
    });
  }
}

class RadioItem {
  final String value;
  final String title;
  final String subTitle;
  RadioItem({required this.value, required this.title, this.subTitle = ''});

  static listFrom(List items) {
    List<RadioItem> list = [];
    for (var item in items) {
      list.add(RadioItem(value: item.id, title: item.name, subTitle: item.subTitle ?? ''));
    }
    return list;
  }
}
