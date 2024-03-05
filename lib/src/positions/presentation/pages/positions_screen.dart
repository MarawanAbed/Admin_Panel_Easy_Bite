import 'package:admin/constants.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:admin/src/users/data/models/create_user_params.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../../core/widgets/texts/custom_rich_text.dart';
import '../../../employees/presentation/widgets/quotation_item.dart';
import '../../../main_index.dart';
import '../../data/models/position_dto.dart';

class PositionsScreen extends BaseStatelessWidget {
  final List<PositionDto> data;
  final Function(String) onDelete;
  final Function(PositionDto) onEdit;

  PositionsScreen(
      {super.key,
      required this.data,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.8,
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
            fit: BoxFit.scaleDown,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.work,
                  size: 100,
                  color: context.primaryColor,
                ),
                10.ph,
                CustomRichText(
                  label: strings.salary,
                  value: item.salary.toString() ?? '',
                ),
                CustomRichText(
                  label: strings.job_name,
                  value: item.positionName ?? '',
                ),
                10.ph,
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
