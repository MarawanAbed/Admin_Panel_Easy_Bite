import 'dart:io';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../../products/presentation/widgets/edit_profile_image.dart';
import '../../data/models/ad_dto.dart';
import '../bloc/ads_bloc.dart';
import 'ads_screen.dart';

class AdsPage extends BaseBlocWidget<DataSuccess<List<AdDto>>, AdsCubit> {
  AdsPage({super.key});

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.banners;

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
  Widget buildWidget(
      BuildContext context, DataSuccess<List<AdDto>> state) {
    return AdsScreen(
      data: state.data ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        showAddUserDialog(
          context,
          (params) {
            bloc.updateUser(params);
          },
          cat: params,
        );
      },
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchInitialData();
  }
}

showAddUserDialog(
    BuildContext context, Function(AdDto) onAddUser,
    {AdDto? cat}) {
  TextEditingController nameController =
      TextEditingController(text: cat?.categoryName);
  bool isAdmin = false;
  File? image;

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                  onAddUser(AdDto(
                    id: cat?.id ?? '',
                    image: image?.path,
                  ));
                },
                child: Text('Save'),
              ),
            ],
          ));
}
