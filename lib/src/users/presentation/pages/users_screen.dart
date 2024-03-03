
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
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          leading: ImageNetwork(
            url: item.userName,
            height: 50,
            width: 50,
          ),
          title: Text(item.userName ?? ''),
          subtitle: Text(item.email ?? ''),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  onDelete(item.id ?? '0');
                },
              ),
              10.pw,
              IconButton(
                icon: const Icon(Icons.edit),
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
