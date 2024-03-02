import 'package:admin/src/auth/presentation/widgets/auth_widget.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../core/routes/navigator.dart';
import '../../../main_index.dart';
import '../../data/models/register_params.dart';
import '../bloc/auth_bloc.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class RegisterPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AuthWidget(
      isLogin: false,
      child: RegisterScreen(
        onRegister: (RegisterParams params) {
          bloc.register(params);
        },
      ),
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.mushafManagementPage);
  }
}
