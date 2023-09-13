import 'package:exam2/utils/helpers/navigte.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:flutter/material.dart';
import '../regeester/regester_screen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunViews().getAppBar(title:'Login'),
      body: Center(
        child: CommunViews().createButton(title: 'Regester', onPressed: (){
          Fip5Navigator.of(context).pushReplacement(const RegesterScreen());

        }),
      ),

    );
  }
}

