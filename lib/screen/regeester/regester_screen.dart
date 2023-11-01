import 'dart:io';
import 'package:exam2/screen/regeester/model_regester.dart';
import 'package:exam2/screen/regeester/regester_con.dart';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../config/app_constants/app_constant.dart';
import '../../utils/ui/commun_views.dart';
class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key? key}) : super(key: key);
  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}
class _RegesterScreenState extends State<RegesterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobilePhoneName = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  XFile? xFile;
  bool _isPasswordObscure = true;
  RegesterController controlle = Get.put(RegesterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommunViews().getAppBar(title: 'Register'),
      bottomSheet: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 20),
        height: 30,
        child: Center(
          child: CommunViews().createButton(
            title: 'Regester',
            onPressed: () async {
             // File file = File(xFile!.path);
              UserModel model = UserModel(
                email: emailController.text,
                password: passwordController.text,
                mobile: mobilePhoneName.text,
                imgUrl: '',
              );
          //    model.file = file;
           //   controlle.createRegesterEmailAndPassword(model);
              // regester with Api
              controlle.registerWithApi(model);

            },
          ),
        ),
      ),
      body: Form(
        key: controlle.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(height: AppConstant.textFiledSpacing),
                _getPlaceholder(),
                //   const SizedBox(height: AppConstant.textFiledSpacing),
                Obx(
                  () => CommunViews().createTextFormFiled(
                      controller: emailController,
                      focusNode: emailFocus,
                      label: 'email',
                      errorText: controlle.emailErorr.value.isEmpty
                          ? null
                          : controlle.emailErorr.value,
                      keyboardType: TextInputType.name,
                      InputActione: TextInputAction.next,
                      onSubmitted: (v) {
                        passwordFocus.requestFocus();
                      }),
                ),

                const SizedBox(height: AppConstant.textFiledSpacing),
                Obx(
                  () => CommunViews().createTextFormFiled(
                      controller: passwordController,
                      focusNode: passwordFocus,
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
                        mobileFocus.requestFocus();
                      }),
                ),
                const SizedBox(height: AppConstant.textFiledSpacing),
                CommunViews().createTextFormFiled(
                  controller: mobilePhoneName,
                  focusNode: mobileFocus,
                  label: 'Mobile Phone',
                  keyboardType: TextInputType.phone,
                  preffixText: '+962',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Choose a photo from gallery and camera circle
  Widget _getPlaceholder() {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () async {
                      Fip5Navigator.of(context).pop();
                      xFile = await _getImage(ImageSource.camera);
                      setState(() {});
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_camera_back,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Gallery",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () async {
                      Fip5Navigator.of(context).pop();
                      xFile = await _getImage(ImageSource.gallery);
                      setState(() {});
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: xFile == null
              ? Lottie.asset('assets/pickanimated.json')
              : Image.file(File(xFile!.path)),
        ),
      ),
    );
  }

  Future<XFile?> _getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    return picker.pickImage(source: source);
  }
}
