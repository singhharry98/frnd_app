import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/utils/colors.dart';

class AuthTextField extends StatelessWidget {

  final String hint;
  final IconData? icon;
  final bool obscure;

  const AuthTextField({
    super.key,
    required this.hint,
     this.icon,
    this.obscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: AppColor.textFieldBackgroundColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}