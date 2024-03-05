
import '../../../main_index.dart';

class AddEditButtons extends StatelessWidget {
  final Function() onDelete;
  final Function() onEdit;
  const AddEditButtons({super.key, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.teal),
          onPressed: ()=> onEdit(),
        ),
        10.pw,
        IconButton(
          icon: Icon(Icons.delete, color: context.errorColor),
          onPressed: ()=> onDelete(),
        ),
      ],
    );
  }
}
