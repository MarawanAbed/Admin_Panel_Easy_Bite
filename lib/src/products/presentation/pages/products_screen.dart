
import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:admin/src/users/data/models/create_user_params.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../employees/presentation/widgets/quotation_item.dart';
import '../../../main_index.dart';
import '../../data/models/product_dto.dart';
import '../widgets/edit_profile_image.dart';

class ProductsScreen extends StatelessWidget {
  final List<ProductDto> data;
  final Function(String) onDelete;
  final Function(ProductDto) onEdit;
  const ProductsScreen({super.key, required this.data, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            margin: 10.paddingBottom,
            decoration: Decorations.shapeDecorationShadow(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               ImageNetwork(
                  url: item.image ?? '',
                  width: 300,
                  height: 200,
               ),
                Text(item.itemName ?? ''),
                Text(item.price.toString() ?? ''),
                Text(item.description ?? ''),
                10.ph,
                AddEditButtons(
                  onDelete: () => onDelete(item.id ?? ''),
                  onEdit: () => onEdit(item),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
