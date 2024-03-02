
import '../../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';
import '../../domain/entities/benefit_dto.dart';

class BenefitsScreen extends StatelessWidget {
  final List<Benefit> data;
  const BenefitsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final item = data[index];
        return ImageNetwork(
          url: item.image ?? "",
        );
      },
    );
  }
}
