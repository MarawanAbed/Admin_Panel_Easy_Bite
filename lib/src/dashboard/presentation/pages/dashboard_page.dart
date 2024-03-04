import 'package:admin/src/categories/data/models/category_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../screens/dashboard/dashboard_screen.dart';
import '../../../categories/data/models/create_category_params.dart';
import '../../../main_index.dart';
import '../bloc/dashboard_bloc.dart';

class DashboardPage extends BaseBlocWidget<UnInitState, DashboardCubit> {
  DashboardPage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchInitialData();
  // }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return DashboardScreen(
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchInitialData();
  }
}


showAddUserDialog(BuildContext context, Function(CreateCategoryParams) onAddUser, {CategoryDto? cat}) {
  TextEditingController nameController = TextEditingController(text: cat?.categoryName);
  bool isAdmin = false;

  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(context.strings.add_category),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: context.strings.category_name,
          controller: nameController,
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          onAddUser(CreateCategoryParams(
            id: cat?.id ?? '',
            categoryName: nameController.text,
          ));
        },
        child: Text('Save'),
      ),
    ],
  ));
}