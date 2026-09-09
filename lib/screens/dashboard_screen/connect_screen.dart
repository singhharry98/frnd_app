import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/common_widgets/conversation_card.dart';
import 'package:frnd_app/screens/dashboard_screen/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/AppImages.dart';
import '../../utils/colors.dart';

class ConnectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.gradientColorTop,
                  AppColor.gradientColorCenter,
                  AppColor.gradientColorBottom,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Connect Screen",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.whiteColor,
                          )),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColor.skipTextColor.withOpacity(0.20),
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: AppColor.greyColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.whiteColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      AppImages.appleIcon,
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
