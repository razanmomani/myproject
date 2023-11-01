import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam2/config/cureant_session.dart';
import 'package:exam2/config/firebase_expations/erorr_mgs.dart';
import 'package:exam2/screen/login/model_log.dart';
import 'package:exam2/screen/profile/profile_screen.dart';
import 'package:exam2/screen/regeester/model_regester.dart';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:exam2/utils/ui/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobilePhoneName = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  RxString emailErorr = ''.obs;
  RxString passwordErorr = ''.obs;
  //fun
  void login(String email, String password) async {
    try {
      if (isValed(email, password)) {
        LoadingScreen.shared.startLoading(Get.context);
        UserCredential response = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (response.user != null) {
          UserModel? model = await getDataFromFirestore(response.user!.uid);
          LoadingScreen.shared.stopeLoading();
          if (model != null) {
            CurentSession().users=model;
            CommunViews().showSnackBar('Success', 'Login Success');
            Fip5Navigator.of(Get.context!).pushAndRemoveUntil(Profile());
          } else {
            CommunViews().showSnackBar('Failed', 'Login Failed');
          }
        }
      }
    } catch (erorr) {
      LoadingScreen.shared.stopeLoading();
      if (erorr is FirebaseException) {
        CommunViews().showSnackBar(
            'Failed', FirebaseErrors.getMessage(erorr.code));
      } else {
        CommunViews().showSnackBar('Failed', erorr.toString());
      }
    }
  }

  bool isValed(String email, String password) {
    emailErorr.value = '';
    passwordErorr.value = '';
    if (email.isEmpty) {
      emailErorr.value = 'Email is Required';
      return false;
    } else if (password.isEmpty) {
      passwordErorr.value = ' password is Required ';
      return false;
    }
    return true;
  }

  //login
  Future<UserModel?> getDataFromFirestore(String uid) async {
    try {
      var collection = FirebaseFirestore.instance.collection('users');
      var result = await collection.where('uid', isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        UserModel model = UserModel.fromMap(result.docs.first.data());
        return model;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //login with Api
  @override
  //api storge data
  void onInit() {
    emailController.text="fip5";
    passwordController.text="123456";
    super.onInit();
  }

  void loginWithApi(String email, String password) async {
    try {
      if (isValed(email, password)) {
        LoadingScreen.shared.startLoading(Get.context);
        var url = Uri.parse(
            'http://newcamels.albatross-solution.com/API/App/MasterCustomerInformation/Login');
        // from backE
        Map<String, dynamic> body = {
          //from backEnd
          "masterCustomerInformationUserName": email,
          "masterCustomerInformationPassword": password,
          "deviceId": "string",
          "deviceType": "string",
          "deviceOs": "string",
          "deviceToken": "string",
          "appVersion": "string"
        };
        var response = await http.post(url, body: json.encode(body),
            headers: {
              // from backend
              "Accept": "application/json",
              "Content-Type": "application/json",
            });
        LoadingScreen.shared.stopeLoading();
        if (response.statusCode == 200) {
          LoginResponse myResp =LoginResponse.fromJson(response.body);
          if(myResp.success==true){
            CurentSession().myUser=myResp.result;
            Fip5Navigator.of(Get.context!).pushAndRemoveUntil(Profile());
            return;
          }else{
            CommunViews().showSnackBar('Failed',myResp.message ??'');
          }
        }
      }
    } catch (erorr) {
      LoadingScreen.shared.stopeLoading();
      if (erorr is FirebaseException) {
        CommunViews().showSnackBar(
            'Failed', FirebaseErrors.getMessage(erorr.code));
      } else {
        CommunViews().showSnackBar('Failed', erorr.toString());
      }
    }
  }
}
