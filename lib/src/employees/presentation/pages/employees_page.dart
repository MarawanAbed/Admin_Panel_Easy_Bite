
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/employee_dto.dart';
import '../bloc/employees_bloc.dart';
import 'employees_screen.dart';

class EmployeesPage extends BaseBlocWidget<DoubleDataSuccess, EmployeesCubit> {
  EmployeesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.employees;
  List<DropDownItem> items = [];

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
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    items = state.data2 ?? [];
    return EmployeesScreen(
      data: state.data1 ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        bloc.updateUser(params);
      },
    );
  }
}

showAddUserDialog(BuildContext context, Function(EmployeeDto) onAddUser,
    {EmployeeDto? user, List<DropDownItem> items = const []}) {
  TextEditingController nameController =
      TextEditingController(text: user?.employeeName);
  TextEditingController emailController =
      TextEditingController(text: user?.email);
  TextEditingController addressController =
      TextEditingController(text: user?.address);
  TextEditingController birthDateController =
      TextEditingController(text: user?.birthDate);
  TextEditingController hireDateController =
      TextEditingController(text: user?.hireDate);
  TextEditingController terminationDateController =
      TextEditingController(text: user?.terminationDate);
  TextEditingController passwordController = TextEditingController();
  String positionId = user?.position ?? '';
  final strings = context.getStrings();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(strings.add_employee),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  hintText: strings.employee_name,
                  controller: nameController,
                ),
                CustomTextField(
                  hintText: strings.email,
                  controller: birthDateController,
                ),
                CustomTextField(
                  hintText: strings.address,
                  controller: addressController,
                ),
                CustomTextField(
                  hintText: strings.birth_date,
                  controller: addressController,
                ),
                CustomTextField(
                  hintText: strings.hire_date,
                  controller: addressController,
                ),
                CustomTextField(
                  hintText: strings.termination_date,
                  controller: addressController,
                ),
                DropDownField(
                    hint: strings.positions,
                    items: items,
                    onChanged: (value) {
                      positionId = value.id ?? '';
                    }),
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
