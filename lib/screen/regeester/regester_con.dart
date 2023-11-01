import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam2/config/firebase_expations/erorr_mgs.dart';
import 'package:exam2/screen/login/login_screen.dart';
import 'package:exam2/screen/regeester/model_regester.dart';
import 'package:exam2/utils/helpers/general_status.dart';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:exam2/utils/ui/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class RegesterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString emailErorr = ''.obs;
  RxString passwordErorr = ''.obs;
  var statusModel = GeneralStatusModel().obs;
  GlobalKey formKey = GlobalKey<FormState>();
  Future<void> createRegesterEmailAndPassword(UserModel userModel) async {
    if (isValed(userModel.email, userModel.password ?? '')) {
      try {
        LoadingScreen.shared.startLoading(Get.context);
        var result = await _auth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password!);
        if (result.user != null) {
          userModel.uid = result.user!.uid;
          userModel.imgUrl = await saveImageStorge(userModel.file!);
          getRegesterFirestoreLogin(userModel);
        } else {
          LoadingScreen.shared.stopeLoading();
          CommunViews().showSnackBar('Failed', 'Regester UnSuccess');
        }
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (erorr) {
        LoadingScreen.shared.stopeLoading();
        if (erorr is FirebaseException) {
          CommunViews()
              .showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
        } else {
          CommunViews().showSnackBar('Failed', 'Regester UnSuccess $erorr');
        }
        FocusManager.instance.primaryFocus!.unfocus();
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
    } else if (password.length < 6) {
      passwordErorr.value = 'please enter Strong password';
      return false;
    }
    return true;
  }
  //firebase regester firestore
  void getRegesterFirestoreLogin(UserModel userModel) async {
    try {
      var collection = FirebaseFirestore.instance.collection('users');
      await collection.add(userModel.toMap());
      LoadingScreen.shared.stopeLoading();
      CommunViews().showSnackBar('Success', 'Regester Success');
      Fip5Navigator.of(Get.context!).pushReplacement(LoginScreen());
    } catch (erorr) {
      if (erorr is FirebaseException) {
        CommunViews()
            .showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
      }
    }
  }
  //storge image in firebase
  Future<String> saveImageStorge(File imgFile) async {
    try {
      Reference storgeReference = FirebaseStorage.instance.ref();
      String fileName =
          "fox5${DateTime.now().microsecondsSinceEpoch}${(Random().nextInt(1000))}";
      Reference imageRef = storgeReference.child("image/$fileName.jpg");
      await imageRef.putFile(imgFile);
      return imageRef.getDownloadURL();
    } catch (erorr) {
      if (erorr is FirebaseException) {
        CommunViews()
            .showSnackBar('Failed', FirebaseErrors.getMessage(erorr.code));
      }
      return "";
    }
  }
 //function regester with Api
  void registerWithApi(UserModel userModel) async {
    LoadingScreen.shared.startLoading(Get.context);
    statusModel.value.updateStatus(GeneralStatus.waiting);
    var url = Uri.parse(
      // from backEnd
        'http://newcamels.albatross-solution.com/API/App/MasterCustomerInformation/RegisterCustomer');
    Map<String, dynamic> body = {
      //from backEnd
      "lookupCountryId":5,
      "masterCustomerInfo: rmationFullName": "stepbystep academy",
      "masterCustomerInformationMobileNo": userModel.mobile,
      "masterCustomerInformationUserName": "fipp5",
      "masterCustomerInformationPassword": userModel.password,
      "deviceId": "string",
      "deviceType": "string",
      "deviceOs": "string",
      "deviceToken": "string",
      "appVersion": "string"
    };
    var response = await http.post(url, body:json.encode(body),
      headers: {
      // from backend
        "Accept": "application/json",
        "Content-Type": "application/json",
      });
    LoadingScreen.shared.stopeLoading();
    if ((response.statusCode >= 200 && response.statusCode < 300)) {
      if (response.body.isEmpty) {
        statusModel.value.updateStatus(GeneralStatus.erorr);
        statusModel.value.updateErorr("Register Failed");
        CommunViews().showSnackBar("Failed", "Registration UnSuccessful");
        return;
      }
      statusModel.value.updateStatus(GeneralStatus.success);
      Fip5Navigator.of(Get.context!).pushAndRemoveUntil(LoginScreen());
      return;
    }
    statusModel.value.updateStatus(GeneralStatus.erorr);
    statusModel.value.updateErorr("Something went wrong");
  }

  get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;

  get isError => statusModel.value.status.value == GeneralStatus.erorr;

  get isSuccess => statusModel.value.status.value == GeneralStatus.success;







}
