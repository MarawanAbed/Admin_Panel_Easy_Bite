

import '../../../main_index.dart';

class FloatingAddButton extends StatelessWidget {
  final Function() onPressed;
  const FloatingAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: context.primaryColor,
      child: Icon(Icons.add),
    );
  }
}
