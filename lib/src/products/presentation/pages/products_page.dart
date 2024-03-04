import 'package:admin/core/widgets/drop_down/drop_down.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/product_dto.dart';
import '../bloc/products_bloc.dart';
import '../widgets/edit_profile_image.dart';
import 'products_screen.dart';

class ProductsPage extends BaseBlocWidget<DoubleDataSuccess, ProductsCubit> {
  ProductsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.products;
  List<DropDownItem> items = [];

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(
            context,
            (params) {
              bloc.createUser(params);
            },
            items: items,
          );
        },
        child: Icon(Icons.add),
      ),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    items = state.data2;
    return ProductsScreen(
      data: state.data1 ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        showAddUserDialog(
          context,
          (params) {
            bloc.updateUser(params);
          },
          user: ProductDto(),
          items: items,
        );
      },
    );
  }
}

showAddUserDialog(BuildContext context, Function(ProductDto) onAddUser,
    {ProductDto? user, required List<DropDownItem> items}) {
  TextEditingController itemNameController =
      TextEditingController(text: user?.itemName);
  TextEditingController priceController =
      TextEditingController(text: user?.price?.toString() ?? '');
  TextEditingController descriptionController = TextEditingController();
  String catId = user?.id ?? '';
  final strings = context.getStrings();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(strings.add_product),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EditProfileImage(
                  image: user?.itemName ?? '',
                  onSelectImage: (file) {},
                ),
                CustomTextField(
                  hintText: strings.product_name,
                  controller: itemNameController,
                ),
                CustomTextField(
                  hintText: strings.price,
                  controller: priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                CustomTextField(
                  hintText: strings.description,
                  controller: descriptionController,
                ),
                DropDownField(
                  hint: strings.categories,
                    items: items,
                    onChanged: (value) {
                      catId = value.id ?? '';
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
                  onAddUser(ProductDto(
                    id: user?.id ?? catId,
                    itemName: itemNameController.text,
                    price: int.parse(priceController.text),
                    description: descriptionController.text,
                  ));
                },
                child: Text('Save'),
              ),
            ],
          ));
}
