import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/screens/auth_screens/create_profile_screen.dart';
import 'package:frnd_app/utils/AppImages.dart';
import 'package:frnd_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widgets/auth_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Image.asset(
                      AppImages.login_image,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      height: 180,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Create account ✨",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Join a community where every conversation matters.",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height:20,
                ),
                const AuthTextField(
                  hint: "Full Name",
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),
                const AuthTextField(
                  hint: "Email Address",
                  icon: Icons.email,
                ),
                const SizedBox(height: 16),
                const AuthTextField(
                  hint: "Password",
                  icon: Icons.lock,
                  obscure: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (v) {},
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              color: AppColor.skipTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(
                              color: AppColor.darkGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: AppColor.skipTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 58,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateProfileScreen(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColor.gradientColorTop,
                              AppColor.gradientColorCenter,
                              AppColor.gradientColorBottom,
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Continue →",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.2,
                            color: AppColor.greyColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.10),
                              blurRadius: 12,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.googleIcon,
                              width: 22,
                              height: 22,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Google",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.2,
                            color: AppColor.greyColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.10),
                              blurRadius: 12,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.appleIcon,
                              width: 22,
                              height: 22,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Apple",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        " Log In",
                        style: TextStyle(
                          color: AppColor.skipTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
