
import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';

import '../../components/base_stateless_widget.dart';


class PopupEditDelete extends BaseStatelessWidget {
  final Function()? onDelete;
  final Function()? onEdit;

   PopupEditDelete({Key? key, this.onDelete, this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [
      if(onEdit != null)
      strings.edit,
      if(onDelete != null)
      strings.delete,
    ];
    return StatefulBuilder(
      builder: (context, setState) {
        return MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              // padding: 20.paddingAll,
              // iconSize: 20,
              alignment: AlignmentDirectional.topEnd,
              icon: const Icon(Icons.more_vert),
              tooltip: 'Show menu',
              // constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
            );
          },
          style: MenuStyle(
           backgroundColor: MaterialStateProperty.all(context.scaffoldBackgroundColor),
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          ),
          menuChildren: List<MenuItemButton>.generate(
            items.length,
                (int index) => MenuItemButton(
              onPressed: () {
                if(items[index] == 'حذف'){
                  onDelete?.call();
                }else{
                  onEdit?.call();
                }
              },
              child: Text(items[index], style: context.bodySmall, textAlign: TextAlign.center,),
            ),
          ),
        );
      }
    );
  }
}

