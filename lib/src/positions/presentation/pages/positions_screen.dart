
import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:admin/src/users/data/models/create_user_params.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';
import '../../data/models/position_dto.dart';

class PositionsScreen extends StatelessWidget {
  final List<PositionDto> data;
  final Function(String) onDelete;
  final Function(PositionDto) onEdit;
  const PositionsScreen({super.key, required this.data, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          title: Text(item.positionName ?? ''),
          subtitle: Text(item.salary.toString() ?? ''),
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
