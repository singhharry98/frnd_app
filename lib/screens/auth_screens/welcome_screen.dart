import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/utils/AppImages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/colors.dart';
import 'login_screen.dart';

class WelComeScreen extends StatelessWidget {
  WelComeScreen({super.key});

  final PageController pageController = PageController();
  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final List<String> images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
    AppImages.onboarding4,
  ];
  final List<String> title = [
    AppImages.title1,
    AppImages.title2,
    AppImages.title3,
    AppImages.title4,
  ];
  final List<String> description = [
    AppImages.description1,
    AppImages.description2,
    AppImages.description3,
    AppImages.description4,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final imageHeight = height * 0.70;
    final bottomSheetHeight = height * 0.30;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
          
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: page == 0
                        ? Row(
                            children: [
                              Image.asset(
                                AppImages.message_icon,
                                width: 40,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "ChitChat",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.arrow_back, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Back",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (page != images.length )
                                InkWell(
                                  onTap: () {
                                    pageController.animateToPage(
                                      images.length,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Text(
                                    "Skip",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.skipTextColor),
                                  ),
                                ),
                            ],
                          ),
                  );
                },
              ),
          
              /// Image Slider
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.4,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height / 1.8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            title[index],
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(description[index],
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              )),
                        )
                      ],
                    );
                  },
                ),
              ),
          
              const SizedBox(height: 20),
          
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ValueListenableBuilder<int>(
                    valueListenable: currentPage,
                    builder: (context, page, child) {
                      return Row(
                        children: List.generate(
                          images.length,
                          (index) {
                            final isSelected = page == index;
          
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 8),
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isSelected
                                    ? null
                                    : AppColor.darkGreyColor.withOpacity(.3),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )),
          
              const SizedBox(height: 20),
          
              /// Continue Button
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

                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft ,
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
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}
