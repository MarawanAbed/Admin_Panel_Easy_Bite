
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../core/widgets/texts/row_texts.dart';
import '../../../main_index.dart';
import '../../data/models/additional_pay_params.dart';
import '../../data/models/deduction_params.dart';
import '../../data/models/employee_dto.dart';
import '../widgets/quotation_item.dart';

class EmployeesScreen extends BaseStatelessWidget {
  final List<EmployeeDto> data;
  final List<DropDownItem> positions;
  final Function(String) onDelete;
  final Function(EmployeeDto) onEdit;
  final Function(AdditionalPayParams) onAddBonus;
  final Function(DeductionParams) onAddDeduction;

  EmployeesScreen(
      {super.key,
      required this.data,
      required this.onDelete,
      required this.onEdit,
      required this.positions,
      required this.onAddBonus,
      required this.onAddDeduction,
      });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 500,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          margin: 10.paddingBottom,
          decoration: Decorations.shapeDecorationShadow(),
          child: Stack(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageNetwork(
                    url: item.image,
                    height: 100,
                    width: 120,
                  ),
                  RowTexts(
                    title: strings.name,
                    value: item.employeeName ?? '',
                  ),
                  RowTexts(
                    title: strings.email,
                    value: item.employeeName ?? '',
                  ),
                  RowTexts(
                    title: strings.address,
                    value: item.address ?? '',
                  ),
                  RowTexts(
                    title: strings.hire_date,
                    value: (item.hireDate ?? '').split('T')[0],
                  ),
                  RowTexts(
                    title: strings.birth_date,
                    value: (item.birthDate ?? '').split('T')[0],
                  ),
                  RowTexts(
                    title: 'Salary',
                    value: item.position?.salary?.toString() ?? '',
                  ),
                  RowTexts(
                    title: 'Bonus',
                    value: item.additionalPay?.toString() ?? '0.0',
                  ),
                  RowTexts(
                    title: 'Deduction',
                    value: item.deduction?.toString() ?? '0.0',
                  ),

                  RowTexts(
                    title: 'Total Salary',
                    value: ((item.position?.salary ?? 0) +
                                (item.additionalPay ?? 0) -
                                (item.deduction ?? 0))
                            .toString() ??
                        '',
                  ),
                  // Text(item.email ?? ''),
                  // Text(item.email ?? ''),
                  // 10.ph,
                  AddEditButtons(
                    onDelete: () => onDelete(item.id ?? ''),
                    onEdit: () => onEdit(item),
                  ),
                  5.ph,
                ],
              ),
              PopupMenuButton(
                offset: const Offset(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Add Bonus'),
                    onTap: () {
                      TextEditingController bonusController = TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Add Bonus'),
                          content: SizedBox(
                            width: 400,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  hintText: 'Amount',
                                  keyboardType: TextInputType.number,
                                  controller: bonusController,
                                  inputFormatters: [
                                    /// allow decimal point only once
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                ),
                                PrimaryButton(
                                  title: 'Add Bonus',
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onAddBonus(AdditionalPayParams(
                                      id: item.id ?? '',
                                      additionalPay:
                                          int.parse(bonusController.text),
                                    ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Add Deduction'),
                    onTap: () {
                      TextEditingController deductionController = TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Add Deduction'),
                          content: SizedBox(
                            width: 400,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  hintText: 'Amount',
                                  keyboardType: TextInputType.number,
                                  controller: deductionController,
                                  inputFormatters: [
                                    /// allow decimal point only once
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                ),
                                PrimaryButton(
                                  title: 'Add Deduction',
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onAddDeduction(DeductionParams(
                                      id: item.id ?? '',
                                      deduction:
                                          int.parse(deductionController.text),
                                    ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // edit button
                  PopupMenuItem(
                    child: const Text('Edit'),
                    onTap: () {
                      onEdit(item);
                    },
                  ),
                  // delete button
                  PopupMenuItem(
                    child: const Text('Delete'),
                    onTap: () {
                      onDelete(item.id ?? '');
                    },
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
