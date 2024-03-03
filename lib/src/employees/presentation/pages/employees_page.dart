import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/employee_dto.dart';
import '../bloc/employees_bloc.dart';
import 'employees_screen.dart';

class EmployeesPage extends BaseBlocWidget<DataSuccess<List<ProfileDto>>, EmployeesCubit> {
  EmployeesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.employees;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context, (params) {
            bloc.createUser(params);
          });
        },
        child: Icon(Icons.add),
      ),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<ProfileDto>> state) {
    return EmployeesScreen(
      data: state.data ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        bloc.updateUser(params);
      },
    );
  }
}


showAddUserDialog(BuildContext context, Function(EmployeeDto) onAddUser, {ProfileDto? user}) {
  TextEditingController _nameController = TextEditingController(text: user?.userName);
  TextEditingController _emailController = TextEditingController(text: user?.email);
  TextEditingController _passwordController = TextEditingController();
  bool isAdmin = false;

  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text('Add User'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: 'Name',
          controller: _nameController,
        ),
        CustomTextField(
          hintText: 'Email',
          controller: _emailController,
        ),
        CustomTextField(
          hintText: 'Password',
          controller: _passwordController,
        ),
        SizedBox(
          height: 40,
          width: 200,
          child: RadioSelectionList(
            isGrid: true,
              crossAxisCount: 2,
            items: [RadioItem(title: 'Admin', value: 'admin'), RadioItem(title: 'User', value: 'user')],
            onChanged: (item) {
              isAdmin = item.value == 'admin';
            },
          ),
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
          onAddUser(EmployeeDto(
            // userName: _nameController.text,
            // email: _emailController.text,
            // password: _passwordController.text,
            // isAdmin: isAdmin,
          ));
        },
        child: Text('Save'),
      ),
    ],
  ));
}