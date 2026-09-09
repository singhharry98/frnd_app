import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/screens/auth_screens/welcome_screen.dart';
import 'package:frnd_app/utils/colors.dart';

import '../utils/AppImages.dart';

class SplashScreen extends StatelessWidget {

   SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>  WelComeScreen(),
        ),
      );
    });

    return  Image.asset(
        AppImages.logo,
        fit: BoxFit.cover,

    );
  }
}
