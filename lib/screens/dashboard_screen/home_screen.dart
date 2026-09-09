import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Home Screen"),
      // ),
      body: Container(
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
                  Text("Home Screen",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.whiteColor,
                      )),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.skipTextColor.withOpacity(0.20),
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
    );
  }
}
