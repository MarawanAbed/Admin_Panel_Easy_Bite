
import 'package:admin/core/widgets/texts/custom_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../main_index.dart';
import '../../../products/presentation/widgets/edit_profile_image.dart';
import '../../data/models/employee_dto.dart';
import '../widgets/quotation_item.dart';

class EmployeesScreen extends BaseStatelessWidget {
  final List<EmployeeDto> data;
  final List<DropDownItem> positions;
  final Function(String) onDelete;
  final Function(EmployeeDto) onEdit;
  EmployeesScreen({super.key, required this.data, required this.onDelete, required this.onEdit, required this.positions});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.6,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          margin: 10.paddingBottom,
          decoration: Decorations.shapeDecorationShadow(),
          child: FittedBox(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditProfileImage(
                  image: item.image ?? '',
                  onSelectImage: (file) {
                    print(file);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(
                      label: strings.name,
                      value: item.employeeName ?? '',
                    ),
                    CustomRichText(
                      label: strings.email,
                      value: item.employeeName ?? '',
                    ),
                    CustomRichText(
                      label: strings.address,
                      value: item.address ?? '',
                    ),
                    CustomRichText(
                      label: strings.hire_date,
                      value: (item.hireDate ?? '').split('T')[0],
                    ),
                    CustomRichText(
                      label: strings.birth_date,
                      value: (item.birthDate ?? '').split('T')[0],
                    ),
                  ],
                ),
                // Text(item.email ?? ''),
                // Text(item.email ?? ''),
                // 10.ph,
                AddEditButtons(
                  onDelete: () => onDelete(item.id ?? ''),
                  onEdit: () => onEdit(item),
                ),
                5.ph,
              ],
            ),
          ),
        );
      },
    );
  }
}
