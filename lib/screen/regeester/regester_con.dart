import 'package:exam2/config/firebase_expations/erorr_mgs.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:exam2/utils/ui/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RegesterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  Future<void> createEmailWithPassword(String email, String password) async {
    if (isValed(email, password)) {
      try {
        LoadingScreen.shard.startLoading(Get.context!);
        var result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        LoadingScreen.shard.stopLoading();
        if (result.user != null) {
          CommunViews().showSnackBar('Success', 'Regester Success');
        } else {
          CommunViews().showSnackBar('Failed', 'Regester UnSuccess');
        }
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (error) {
        LoadingScreen.shard.stopLoading();
        if (error is FirebaseException) {
          CommunViews()
              .showSnackBar('Failed', FirebaseErrors.getMessage(error.code));
        } else {
          CommunViews().showSnackBar('Failed', 'Regester UnSuccess');
          FocusManager.instance.primaryFocus!.unfocus();
        }
      }
    }
  }
  bool isValed(String email, String password) {
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = 'you must the email';
      return false;
    } else if (password.isEmpty) {
      passwordError.value = 'You must enter the password';
      return false;
    } else if (password.length < 6) {
      passwordError.value = 'The maximum password is 6 or more';
      return false;
    }
    return true;
  }
}


/*
import 'package:exam2/config/firebase_expations/erorr_mgs.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/ui/loading_screen.dart';
class RegesterController extends GetxController{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  RxString emailError=''.obs;
  RxString passwordError=''.obs;
  Future<void> createWithEmailAndPassword(String email,String password)async{
  if(isValed(email,password)){
    try{
      LoadingScreen.shred.startLoading(Get.context!);
      var result=await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      LoadingScreen.shred.stopLoading();
      if(result.user !=null){
        CommunViews().showSnackBar('Success', 'Regester Success');
      }else{
        CommunViews().showSnackBar('Failed', 'Regester UnSuccess');
      }
      FocusManager.instance.primaryFocus!.unfocus();
    }catch(erorr){
      if(erorr is FirebaseException){
        CommunViews().showSnackBar('Failed' ,FirebaseErrors.getMessage(erorr.code));
      }
      LoadingScreen.shred.stopLoading();
      CommunViews().showSnackBar('Failed', 'Regester UnSuccess');
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
  }
bool isValed(String email,String password){
    emailError.value='';
    passwordError.value='';
    if(email.isEmpty){
      emailError.value='You must enter an email';
      return false;
    }else if(password.isEmpty){
      passwordError.value='You must enter an password';
      return false;
    }else if(password.length<6){
      passwordError.value='The password must be 6 or more';
      return false;
    }return true;
}
}

*/
