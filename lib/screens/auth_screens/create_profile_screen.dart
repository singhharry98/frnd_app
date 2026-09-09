import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/common_widgets/auth_text_field_widget.dart';
import 'package:frnd_app/controller/choose_interest_controller.dart';
import 'package:frnd_app/screens/auth_screens/choose_interest_screen.dart';
import 'package:frnd_app/screens/auth_screens/create_profile_header.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/AppImages.dart';
import '../../utils/colors.dart';

class CreateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChooseInterestController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColor.whiteColor,
              body: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OnboardingHeader(
                                  currentStep: 1,
                                  onBack: () {
                                    Navigator.pop(context);
                                  }),
                              const SizedBox(height: 40),
                              Text(
                                "Let's setup your profile ✨",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "A great profile helps you connect faster.",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    AppImages.createProfileBackgroundImage,
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 220,
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 140,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColor.skipTextColor
                                                  .withOpacity(0.20),
                                              blurRadius: 12,
                                              spreadRadius: 1,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            color: AppColor.greyColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child:
                                              controller.profileImage.value ==
                                                      null
                                                  ? ClipOval(
                                                    child: Icon(Icons.panorama),
                                                  )
                                                  : ClipOval(
                                                    child: Image.asset(
                                                        "",
                                                        fit: BoxFit.cover,
                                                      ),
                                                  ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 2,
                                        bottom: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller
                                                .showImagePicker(controller);
                                          },
                                          child: Container(
                                            width: 38,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: const LinearGradient(
                                                colors: [
                                                  AppColor.gradientColorTop,
                                                  AppColor.gradientColorCenter,
                                                  AppColor.gradientColorBottom,
                                                ],
                                              ),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 3,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Full Name",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      filled: true,
                                      fillColor: Color(0xffF8F8FC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date of Birth",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      filled: true,
                                      fillColor: Color(0xffF8F8FC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Short Bio",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    maxLines: 4,
                                    maxLength: 100,
                                    decoration: InputDecoration(
                                      hintText: "",
                                      filled: true,
                                      fillColor: const Color(0xffF8F8FC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none,
                                      ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                          builder: (context) =>
                                              ChooseInterestScreen(),
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
                                          "Continue",
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
                            ]),
                      ))));
        });
  }
}
