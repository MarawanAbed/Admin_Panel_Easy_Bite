
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
        return ListTile(
          leading: ImageNetwork(
            url: item.categoryName,
            height: 50,
            width: 50,
          ),
          title: Text(item.categoryName ?? ''),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
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
        );
      },
    );
  }
}
