import 'package:exam2/firebase_options.dart';
import 'package:exam2/screen/prodect/prodect_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'screen/splach/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return   GetMaterialApp(
        home:
        //ProdectScreen(),
        SplachScreen(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
