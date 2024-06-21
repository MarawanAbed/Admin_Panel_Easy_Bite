import 'dart:io';

import 'package:admin/src/employees/data/models/employee_params.dart';
import 'package:admin/src/users/presentation/widgets/quotation_item.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../../products/presentation/widgets/edit_profile_image.dart';
import '../../data/models/employee_dto.dart';
import '../bloc/employees_bloc.dart';
import 'employees_screen.dart';

class EmployeesPage extends BaseBlocWidget<DoubleDataSuccess, EmployeesCubit> {
  EmployeesPage({super.key});

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
      floatingActionButton: FloatingAddButton(
        onPressed: () {
          showAddUserDialog(context, (params) {
            bloc.createUser(params);
          }, items: items);
        },
      ),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    items = state.data2 ?? [];
    return EmployeesScreen(
      data: state.data1 ?? [],
      positions: state.data2,
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        showAddUserDialog(context, (params) {
          bloc.updateUser(params);
        }, user: params, items: items);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchInitialData();
  }

}

showAddUserDialog(BuildContext context, Function(EmployeeParams) onAddUser,
    {EmployeeDto? user, List<DropDownItem> items = const []}) {
  TextEditingController nameController =
      TextEditingController(text: user?.employeeName);
  TextEditingController emailController =
      TextEditingController(text: user?.email);
  TextEditingController addressController =
      TextEditingController(text: user?.address);
  TextEditingController birthDateController =
      TextEditingController(text: user?.birthDate?.split('T')[0]);
  TextEditingController hireDateController =
      TextEditingController(text: user?.hireDate?.split('T')[0]);
  TextEditingController terminationDateController =
      TextEditingController(text: user?.terminationDate?.split('T')[0]);
  TextEditingController passwordController = TextEditingController();
  String positionId = items.firstOrNull((element) => element.title == user?.position?.positionName)
      ?.id ??
      '';
  final strings = context.getStrings();
  File imageFile = File('');
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(strings.add_employee),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EditProfileImage(
                  image: user?.image ?? '',
                  onSelectImage: (file) {
                    imageFile = file;
                  },
                ),
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
                  controller: birthDateController,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      birthDateController.text = value.toString();
                    });
                  },
                ),
                CustomTextField(
                  hintText: strings.hire_date,
                  controller: hireDateController,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      hireDateController.text = value.toString();
                    });
                  },
                ),
                CustomTextField(
                  hintText: strings.termination_date,
                  controller: terminationDateController,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      terminationDateController.text = value.toString();
                    });
                  }
                ),
                DropDownField(
                  hint: strings.positions,
                  items: items,
                  onChanged: (value) {
                    positionId = value.id ?? '';
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onAddUser(EmployeeParams(
                    employeeName: nameController.text,
                    email: emailController.text,
                    address: addressController.text,
                    birthDate: birthDateController.text,
                    hireDate: hireDateController.text,
                    terminationDate: terminationDateController.text,
                    position: positionId,
                    image: imageFile.path.isEmpty ? user?.image : imageFile.path,
                    id: user?.id,
                  ));
                },
                child: const Text('Save'),
              ),
            ],
          ));
}
