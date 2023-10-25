
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam2/config/cureant_session.dart';
import 'package:exam2/config/firebase_expations/erorr_mgs.dart';
import 'package:exam2/screen/my_home.dart';
import 'package:exam2/screen/regeester/model_regester.dart';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:exam2/utils/ui/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
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
            CurentSession().model=model;
            CommunViews().showSnackBar('Success', 'Login Success');
            Fip5Navigator.of(Get.context!).pushAndRemoveUntil(const MyHome());
          }else {
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
}
