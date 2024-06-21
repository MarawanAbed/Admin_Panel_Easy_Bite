

import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';
import '../../data/models/ad_dto.dart';

class AdsScreen extends StatelessWidget {
  final List<AdDto> data;
  final Function(String) onDelete;
  final Function(AdDto) onEdit;
  const AdsScreen({super.key, required this.data, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return Padding(
          padding: 20.paddingBottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageNetwork(
                url: item.image,
                height: 300,
               width: double.infinity,
              ),
              20.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        onDelete(item.id ?? '0');
                      },
                    ),
                  ),
                  20.pw,
                  Container(
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        onEdit(item);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
