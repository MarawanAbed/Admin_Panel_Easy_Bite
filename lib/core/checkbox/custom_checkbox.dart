import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final String title;
  final Function(bool)? onChanged;
  final bool? isUnderline;

  const CustomCheckbox(
      {Key? key, required this.title, this.onChanged, this.isUnderline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAgree = false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatefulBuilder(builder: (context, setState) {
          return Checkbox(
            value: isAgree,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            onChanged: (value) {
              setState(() {
                isAgree = value!;
              });
              onChanged!(isAgree);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        }),
        Flexible(
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 12, decoration: isUnderline! ? TextDecoration.underline : TextDecoration.none)
            )
        ),
      ],
    );
  }
}


class CustomCheckboxTile extends StatelessWidget {
  final String title;
  final Function(bool)? onChanged;
  final bool? isUnderline;

  const CustomCheckboxTile(
      {Key? key, required this.title, this.onChanged, this.isUnderline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAgree = false;
    return CheckboxListTile(
        value: isAgree,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      onChanged: (value) {
        onChanged!(isAgree);
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 12, decoration: isUnderline! ? TextDecoration.underline : TextDecoration.none)
      ),
    );
  }
}
