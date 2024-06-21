import 'dart:io';

import 'package:admin/src/categories/data/models/category_dto.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../../products/presentation/widgets/edit_profile_image.dart';
import '../../data/models/create_category_params.dart';
import '../bloc/categories_bloc.dart';
import 'categories_screen.dart';

class CategoriesPage extends BaseBlocWidget<DataSuccess<List<CategoryDto>>, CategoriesCubit> {
  CategoriesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.categories;

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
  Widget buildWidget(BuildContext context, DataSuccess<List<CategoryDto>> state) {
    return CategoriesScreen(
      data: state.data ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        showAddUserDialog(context, (params) {
          bloc.updateUser(params);
        }, cat: params);
      },
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
  File? image;

  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(context.strings.add_category),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EditProfileImage(
          image: cat?.image ?? '',
          onSelectImage: (file) {
            image = file;
          },
        ),
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
            image: image?.path,
          ));
        },
        child: Text('Save'),
      ),
    ],
  ));
}