import 'dart:io';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_constants/app_constant.dart';
import '../../utils/ui/commun_views.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key? key}) : super(key: key);
  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController passwordName = TextEditingController();
  TextEditingController mobilePhoneName = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  XFile? file;
  bool _isPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommunViews().getAppBar(title: 'Register'),
        bottomSheet: Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 20),
          height: 30,
          child: Center(
            child: CommunViews().createButton(title: 'Confirm', onPressed: () {}),
          ),
        ),
        body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         // const SizedBox(height: AppConstant.textFiledSpacing),
                        _getPlaceholder(),
                       //   const SizedBox(height: AppConstant.textFiledSpacing),
                        CommunViews().createTextFormFiled(controller: userName,
                            focusNode: userNameFocus,
                            label: 'User Name',
                            keyboardType: TextInputType.name,
                            InputActione: TextInputAction.next,
                            onSubmitted: (v) {
                              passwordFocus.requestFocus();}),
                        const SizedBox(height: AppConstant.textFiledSpacing),
                        CommunViews().createTextFormFiled(
                            controller: passwordName,
                            focusNode: passwordFocus,
                            label: 'Password',
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
                      file = await _getImage(ImageSource.camera);
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
                      file = await _getImage(ImageSource.gallery);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: SizedBox(
          child: file == null
              ? Lottie.asset('assets/pickanimated.json')
              : Image.file(File(file!.path)),
        ),
      ),
    );
  }

  Future<XFile?> _getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    return picker.pickImage(source: source);
  }
}
