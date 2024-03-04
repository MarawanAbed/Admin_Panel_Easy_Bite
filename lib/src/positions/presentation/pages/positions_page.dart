import 'package:admin/src/profile/data/models/profile_dto.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/position_dto.dart';
import '../bloc/positions_bloc.dart';
import 'positions_screen.dart';

class PositionsPage extends BaseBlocWidget<DataSuccess<List<PositionDto>>, PositionsCubit> {
  PositionsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.users;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddJobDialog(context, (params) {
            bloc.createUser(params);
          });
        },
        child: Icon(Icons.add),
      ),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<PositionDto>> state) {
    return PositionsScreen(
      data: state.data ?? [],
      onDelete: (id) {
        bloc.deleteUser(id);
      },
      onEdit: (params) {
        bloc.updateUser(params);
      },
    );
  }
}


showAddJobDialog(BuildContext context, Function(PositionDto) onAddUser, {PositionDto? user}) {
  TextEditingController positionNameController = TextEditingController(text: user?.positionName);
  TextEditingController salaryController = TextEditingController(text: user?.salary?.toString());
  bool isAdmin = false;
  final strings = context.getStrings();
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(user == null ? strings.add_job : strings.edit_job),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: strings.job_name,
          controller: positionNameController,
        ),
        CustomTextField(
          hintText: strings.salary,
          controller: salaryController,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          onAddUser(PositionDto(
            id: user?.id,
            positionName: positionNameController.text,
            salary: int.tryParse(salaryController.text),
          ));
        },
        child: Text('Save'),
      ),
    ],
  ));
}