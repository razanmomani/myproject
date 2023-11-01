import 'package:exam2/config/cureant_session.dart';
import 'package:exam2/screen/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<UserController>(
              init: UserController(),
              builder: (controller) {
                return Column(
                  children: [
                    //Api
                    Text("Hello User   :" + CurentSession().myUser!.masterCustomerInformationFullName!),
                    Text("mobile  :"+CurentSession().myUser!.masterCustomerInformationMobileNo!),
                    Text("userName : "+CurentSession().myUser!.masterCustomerInformationUserName!),

                    //firebase
                   /* Text('Full Name: ${controller.user.value.fullName}'),
                    Text('Email: ${controller.user.value.emaiol}'),
                    Text('Phone: ${controller.user.value.mobile}'),*/
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(EditProfilePage());
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  final UserController _userController = Get.find();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: GetBuilder<UserController>(
          init:UserController() ,
          builder: (userController){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fullNameController,
                    decoration:  InputDecoration(
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    userController.updateUserData(
                      userController.user.value.id,
                      mobileController.text,
                      emailController.text,
                      fullNameController.text,
                    );
                    Get.back();
                  },
                  child: Text('Save'),
                ),
              ],
            );




          },

        ),
        ),

    );
  }
}
