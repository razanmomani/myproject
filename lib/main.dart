import 'package:exam2/screen/autoe_complate.dart';
import 'package:exam2/screen/exam_list.dart';
import 'package:exam2/screen/grid_view_screen.dart';
import 'package:exam2/screen/home_screen.dart';
import 'package:exam2/screen/list_view.dart';
import 'package:exam2/model/radio_buttoan.dart';
import 'package:exam2/model/tap_appbar.dart';
import 'package:exam2/screen/my_home.dart';
import 'package:exam2/screen/project.dart';
import 'package:exam2/screen/sliver_appbar.dart';
import 'package:exam2/screen/splach/splach_screen.dart';
import 'package:exam2/screen/text_form_fielld.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType) {
      return MaterialApp(
        home: SplachScreen(),
        debugShowCheckedModeBanner: false,
      );
    }
    );

  }
}
