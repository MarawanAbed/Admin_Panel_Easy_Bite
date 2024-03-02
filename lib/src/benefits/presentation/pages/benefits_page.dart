import '../../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../bloc/benefits_bloc.dart';
import 'benefits_screen.dart';

class BenefitsPage extends BaseBlocWidget<DoubleDataSuccess, BenefitsCubit> {
  BenefitsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.benefits;

  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    return BenefitsScreen(
      data: state.data1,
    );
  }
}
