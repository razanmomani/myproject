import 'dart:async';
import 'package:exam2/screen/splach/intro_screen.dart';
import 'package:exam2/utils/helpers/navigte.dart';
import 'package:exam2/utils/helpers/shared_preferences_helper.dart';
import 'package:exam2/utils/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../config/cashe_key.dart';
import '../login/login_screen.dart';
class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Lottie.asset('assets/animated_commn'),
            SizedBox(
              height: 5.h,
            ),
            TextView(
              title: 'Shopping',
              fontSize: 25.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _navigate() {
    Timer(const Duration(seconds: 5), () async {
      bool? isIntroEnteredBefore = await SharedPreferencesHelper()
          .read(key: CasheKeys.introKey, type: SaveType.boolType) as bool?;
       Fip5Navigator.of(context).pushReplacement(
          isIntroEnteredBefore != null && isIntroEnteredBefore == true
              ? const LoginScreen()
              : const IntroScreen());
    });
  }
}
