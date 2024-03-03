import 'package:admin/core/components/base_widget_bloc.dart';

import '../../../../../core/routes/navigator.dart';
import '../../../../main_index.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_widget.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class LoginPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AuthWidget(
      child: LoginScreen(
        onLogin: (loginParams) {
          bloc.login(loginParams);
        },
      ),
    );
  }


  @override
  onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.dashboard);
  }
}
