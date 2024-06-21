import 'dart:io';

import 'package:admin/core/widgets/drop_down/drop_down.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/product_dto.dart';
import '../../data/models/product_params.dart';
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
      onAddStock: (id) {
        // bloc.addStock(id);
      },
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (user) {
        showAddUserDialog(
          context,
          (params) {
            bloc.updateUser(params);
          },
          user: user,
          items: items,
        );
      },
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchInitialData();
  }
}

showAddUserDialog(BuildContext context, Function(ProductParams) onAddUser,
    {ProductDto? user, required List<DropDownItem> items}) {
  TextEditingController itemNameController =
      TextEditingController(text: user?.itemName);
  TextEditingController priceController =
      TextEditingController(text: user?.price?.toString() ?? '');
  TextEditingController stockController =
  TextEditingController(text: user?.stock?.toString() ?? '');
  TextEditingController descriptionController =
      TextEditingController(text: user?.description);
  String catId = items.firstOrNull((element) => element.title == user?.category?.categoryName)
          ?.id ??
      '';
  File image = File('');
  final strings = context.getStrings();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Add Product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EditProfileImage(
            image: user?.image ?? '',
            onSelectImage: (file) {
              print('file: $file');
              image = file;
            },
          ),
          CustomTextField(
            hintText: strings.product_name,
            controller: itemNameController,
          ),
          CustomTextField(
            hintText: strings.price,
            controller: priceController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          CustomTextField(
            hintText: strings.price,
            controller: stockController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          CustomTextField(
            hintText: strings.description,
            controller: descriptionController,
          ),
          DropDownField(
            hint: strings.categories,
            items: items,
            value: catId,
            onChanged: (value) {
              catId = value.id ?? '';
            },
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
            onAddUser(ProductParams(
              id: user?.id,
              itemName: itemNameController.text,
              price: int.parse(priceController.text),
              description: descriptionController.text,
              image: image.path.isNotEmpty ? image.path : user?.image,
              categoryId: catId,
              stock: int.parse(stockController.text),
            ));
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
