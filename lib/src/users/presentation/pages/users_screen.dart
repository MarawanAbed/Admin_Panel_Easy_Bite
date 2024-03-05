
import 'package:admin/src/employees/presentation/widgets/quotation_item.dart';
import 'package:admin/src/products/presentation/widgets/edit_profile_image.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';

class UsersScreen extends StatelessWidget {
  final List<ProfileDto> data;
  final Function(String) onDelete;
  final Function(ProfileDto) onEdit;
  const UsersScreen({super.key, required this.data, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.7,
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
              children: [
                EditProfileImage(
                 image: item.userName ?? '',
                  onSelectImage: (file) {
                    print(file);
                  },
                ),
                Text(item.userName ?? ''),
                Text(item.email ?? ''),
                10.ph,
                AddEditButtons(
                  onDelete: () => onDelete(item.id ?? ''),
                  onEdit: () => onEdit(item),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
