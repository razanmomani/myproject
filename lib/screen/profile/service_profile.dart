import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam2/screen/profile/profile_model.dart';

class FirebaseService {
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<User> getUserData(String userId) async {
    DocumentSnapshot userSnapshot = await _usersCollection.doc(userId).get();
    return User(
      id: userId,
      mobile: userSnapshot['mobile'],
      email: userSnapshot['email'],
      fullName: userSnapshot['fullName'],


    );
  }
  Future<void> updateUserData(String userId, String mobile, String email,String fullName) async {
    await _usersCollection.doc(userId).update({
      'mobile': mobile,
      'email': email,
      'fullName':fullName
    });
  }
  Future<void> deleteUserData(String userId) async {
    await _usersCollection.doc(userId).delete();
  }
}
