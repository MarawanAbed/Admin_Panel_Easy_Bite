import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';

import '../../../../../core/components/base_stateless_widget.dart';

class CheckBoxTermsConditions extends BaseStatelessWidget {
  final void Function(bool?)? onChanged;
   CheckBoxTermsConditions({super.key, this.onChanged});

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.1,
          child: StatefulBuilder(
            builder: (context, snapshot) {
              return Checkbox(
                value: value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                activeColor: context.primaryColor,
                side: BorderSide(
                  color: context.dividerColor,
                  width: 1,
                ),
                visualDensity: VisualDensity.compact,
                onChanged: (value) {
                  snapshot(() {
                    this.value = value!;
                  });
                  onChanged!(value);
                },
              );
            }
          ),
        ),
        Text(
          strings.do_you_agree,
          style: bodyLarge.copyWith(fontSize: 16),
        ),
        5.pw,
        Text(
          strings.our_terms_rules,
          style: headlineLarge.copyWith(fontSize: 16),
        ),
      ],);
  }
}
