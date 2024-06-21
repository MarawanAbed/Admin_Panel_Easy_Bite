
import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:admin/src/users/data/models/create_user_params.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';
import '../../data/models/category_dto.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryDto> data;
  final Function(String) onDelete;
  final Function(CategoryDto) onEdit;
  const CategoriesScreen({super.key, required this.data, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return Padding(
          padding: 10.paddingBottom,
          child: ListTile(
            tileColor: context.cardColor,
            title: Row(
              children: [ImageNetwork(
                url: item.image,
                height: 100,
                width: 120,
              ),
                10.pw,
                Text(item.categoryName ?? ''),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    onDelete(item.id ?? '0');
                  },
                ),
                10.pw,
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    onEdit(item);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
