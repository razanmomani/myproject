import 'package:exam2/utils/ui/commun_views.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunViews().getAppBar(title:'Login'),

    );
  }
}

