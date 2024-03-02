import 'package:flutter/foundation.dart';
import 'package:admin/core/resources/validation.dart';

import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';
import '../../data/models/register_params.dart';
import '../widgets/check_box_terms_conditions.dart';

class RegisterScreen extends BaseStatelessWidget {
  final Function(RegisterParams)? onRegister;

  RegisterScreen({Key? key, this.onRegister}) : super(key: key);

  StreamStateInitial<bool> isAgreeStream = StreamStateInitial<bool>();

  final _userNameController = TextEditingController();
  final _userFamilyNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: kIsWeb ? 500 : double.infinity,
            decoration: Decorations.shapeBottomShadow( ),
            child: Column(
              children: [
                Text(
                  strings.create_account,
                  style:  context.headlineLarge,
                ),
                20.ph,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _userNameController,
                        hintText: strings.name,
                        // keyboardType: TextInputType.text,
                      ),
                    ),
                    20.pw,
                    Expanded(
                      child: CustomTextField(
                        controller: _userFamilyNameController,
                        hintText: strings.family_name,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  controller: _phoneController,
                  hintText: strings.phone_number,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // validator: (String? value)=> Validation.phone(value: value ?? ""),
                ),

                CustomTextField(
                  controller: _emailController,
                  hintText: strings.email,
                  validator: (String? value)=>Validation.validateEmail(value ?? ""),
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: strings.password,
                  isPassword: true,
                  validator: (String? value)=>Validation.validatePassword(value ?? ""),
                ),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: strings.confirm_password,
                  validator: (String? value)=>Validation.validatePassword(value ?? ""),
                ),
                CheckBoxTermsConditions(
                  onChanged: (value) {
                    isAgreeStream.setData(value ?? false);
                  },
                ),
              ],
            ),
          ),
          StreamBuilder<bool>(
              stream: isAgreeStream.stream,
              builder: (context, snapshot) {
                return PrimaryButton(
                  title: strings.create,
                  margin: 20.paddingAll,
                  width: kIsWeb ? 500 : double.infinity,
                  onPressed: snapshot.data == true
                      ? () {
                          onRegisterPressed();
                        }
                      : null,
                  //buttonTextColor: AppColors.appTextColorWhite,
                );
              }),
        ],
      ),
    );
  }

  void onRegisterPressed() {
    if (formKey.currentState!.validate()) {
      onRegister!(RegisterParams(
       firstName: _userNameController.text,
        lastName: _userFamilyNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
        phone: _phoneController.text,
      ));
    }
  }
}
