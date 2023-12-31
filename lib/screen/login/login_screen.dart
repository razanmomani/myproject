import 'package:exam2/screen/login/login_contr.dart';
import 'package:exam2/screen/regeester/regester_screen.dart';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/app_constants/app_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  XFile? xFile;
  LoginController controlle = Get.put(LoginController());
  bool _isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunViews().getAppBar(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CommunViews().createTextFormFiled(
                    controller: controlle. emailController,
                    focusNode:controlle. emailFocus,
                    label: 'email',
                    errorText: controlle.emailErorr.value.isEmpty
                        ? null
                        : controlle.emailErorr.value,
                    keyboardType: TextInputType.name,
                    InputActione: TextInputAction.next,
                    onSubmitted: (v) {
                      controlle.  passwordFocus.requestFocus();
                    }),
              ),
              const SizedBox(height: AppConstant.textFiledSpacing),
              Obx(
                () => CommunViews().createTextFormFiled(
                    controller:controlle. passwordController,
                    focusNode:controlle. passwordFocus,
                    label: 'Password',
                    errorText: controlle.passwordErorr.value.isEmpty
                        ? null
                        : controlle.passwordErorr.value,
                    isObscuer: _isPasswordObscure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                      child: Icon(
                        _isPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    InputActione: TextInputAction.next,
                    onSubmitted: (v) {
                      controlle.  mobileFocus.requestFocus();
                    }),
              ),
              CommunViews().createButton(
                  title: 'Login',
                  onPressed: () {
                    //with firebase
                   /* controlle.login(
                        emailController.text, passwordController.text);*/
                    /////////////////////////
                    //with api
                   controlle.loginWithApi(controlle.emailController.text,controlle.passwordController.text);
                  }),
              CommunViews().createButton(
                  title: 'Regester',
                  onPressed: () {
                    Fip5Navigator.of(Get.context!).pushReplacement(const RegesterScreen());
                  }),



            ],
          ),
        ),
      ),
    );
  }
}
