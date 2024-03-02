import 'package:flutter/foundation.dart';
import 'package:admin/src/auth/data/models/login_params.dart';
import 'package:admin/src/main_index.dart';

import '../../../../../core/resources/validation.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams) onLogin;
   LoginScreen({Key? key, required this.onLogin}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  debugging() {
    if (kDebugMode) {
      _emailController.text = "admin@easybite.com";
      _passwordController.text = "admin";
    }
  }
  @override
  Widget build(BuildContext context) {

    debugging();
    return Form(
      key: _key,
      child: SingleChildScrollView(
        padding: 40.paddingAll,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: kIsWeb ? 500 : double.infinity,
                decoration: Decorations.shapeBottomShadow( ),
                child: Column(
                  children: [
                    Text(
                      strings.login,
                      style:  context.headlineLarge,
                    ),
                    20.ph,
                    CustomTextField(
                      controller: _emailController,
                      hintText: strings.email,
                      validator: (String? value)=> Validation.validateEmail(value ?? ""),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    20.ph,
                    CustomTextField(
                      controller: _passwordController,
                      hintText: strings.password,
                      isPassword: true,
                      validator: (String? value)=> Validation.validatePassword(value ?? ""),
                    ),
                    10.ph,
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: Text(
                    //     strings.forgot_password,
                    //     // fontSize: FontSizer.s13,
                    //     // fontWeight: FontWeightManager.bold700,
                    //     // fontColor: ColorsManager.brownColor,
                    //   ),
                    // ),
                  ],
                ),
              ),

              PrimaryButton(
                title: strings.login.toUpperCase(),
                margin: 20.paddingAll,
                width: kIsWeb ? 500 : double.infinity,
                onPressed: (){
                  onLoginPressed();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (_key.currentState!.validate()) {
      onLogin(LoginParams(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }
}
