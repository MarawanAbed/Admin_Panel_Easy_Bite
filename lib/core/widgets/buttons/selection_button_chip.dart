import 'package:flutter/material.dart';

class SelectionButtonChip extends StatelessWidget {
  final List<String> types;
  final EdgeInsetsGeometry? padding;
  final void Function(bool)? onSelected;
  const SelectionButtonChip({Key? key, required this.types, this.onSelected, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedType = '';
    ThemeData theme = Theme.of(context);
    return   StatefulBuilder(
      builder: (context, setState) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: types
              .map((index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(index,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: _selectedType == index
                        ? theme.cardColor
                        : theme.primaryColor,
                    fontSize: 15,
                  )),
              selected: _selectedType == index,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selectedColor: theme.primaryColor,
              backgroundColor: theme.cardColor,
              side: BorderSide(
                color: theme.primaryColor,
                width: 1,
              ),
              padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedType = index;
                  });
                  onSelected!(selected);
                }
              },
            ),
          ))
              .toList(),
        );
      },
    );
  }
}
