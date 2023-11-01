import 'package:exam2/screen/profile/profile_model.dart';
import 'package:exam2/screen/profile/service_profile.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  var user = User(id: '', mobile: '', email: '',fullName: '').obs;

  void fetchUserData(String userId) async {
    var userData = await _firebaseService.getUserData(userId);
    user.value = userData;
  }

  void updateUserData(String userId, String mobile, String email,String fullName) async {
    await _firebaseService.updateUserData(userId, email,mobile,fullName);
    fetchUserData(userId);
  }

  void deleteUserData(String userId) async {
    await _firebaseService.deleteUserData(userId);
    user.value = User(id: '', mobile: '', email: '',fullName: '');
  }
}
