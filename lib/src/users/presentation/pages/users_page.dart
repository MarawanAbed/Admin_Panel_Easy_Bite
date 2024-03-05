import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/create_user_params.dart';
import '../bloc/users_bloc.dart';
import '../widgets/quotation_item.dart';
import 'users_screen.dart';

class UsersPage
    extends BaseBlocWidget<DataSuccess<List<ProfileDto>>, UsersCubit> {
  UsersPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.users;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      floatingActionButton: FloatingAddButton(
        onPressed: () {
          showAddUserDialog(context, (params) {
            bloc.createUser(params);
          });
        },
      ),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<ProfileDto>> state) {
    return UsersScreen(
      data: state.data ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        showAddUserDialog(context, (params) {
          bloc.updateUser(params);
        }, user: params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchInitialData();
  }
}

showAddUserDialog(BuildContext context, Function(CreateUserParams) onAddUser,
    {ProfileDto? user}) {
  TextEditingController nameController =
      TextEditingController(text: user?.userName);
  TextEditingController emailController =
      TextEditingController(text: user?.email);
  TextEditingController passwordController =
      TextEditingController(text: user?.password);
  bool isAdmin = false;
  final strings = context.getStrings();

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(user == null ? strings.add_user : strings.edit_user),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  hintText: strings.name,
                  controller: nameController,
                ),
                CustomTextField(
                  hintText: strings.email,
                  controller: emailController,
                ),
                CustomTextField(
                  hintText: strings.password,
                  controller: passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: RadioSelectionList(
                    isGrid: true,
                    crossAxisCount: 2,
                    items: [
                      RadioItem(title: strings.admin, value: 'admin'),
                      RadioItem(title: strings.user, value: 'user')
                    ],
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
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onAddUser(CreateUserParams(
                    id: user?.id,
                    userName: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    isAdmin: isAdmin,
                  ));
                },
                child: const Text('Save'),
              ),
            ],
          ));
}
