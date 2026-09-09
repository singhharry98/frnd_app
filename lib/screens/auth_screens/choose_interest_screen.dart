import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/controller/choose_interest_controller.dart';
import 'package:frnd_app/screens/auth_screens/SelectionInterestScreen.dart';
import 'package:frnd_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_profile_header.dart';

class ChooseInterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChooseInterestController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OnboardingHeader(
                      currentStep: 2,
                      onBack: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What are you into? ✨",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Pick at least 5 interests so we can match you with people you'll actually vibe with.",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "0 / 5 selected",
                        ),
                      )),
                  Obx(
                    () => Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: controller.interests.map((item) {
                        final selected = controller.isSelected(item.title);

                        return GestureDetector(
                          onTap: () {
                            controller.toggle(item.title);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? const Color(0xffF3E9FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: selected
                                    ? Colors.deepPurple
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(item.emoji),
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.deepPurple
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: controller.canContinue
                              ? const LinearGradient(
                                  colors: [
                                    AppColor.gradientColorTop,
                                    AppColor.gradientColorCenter,
                                    AppColor.gradientColorBottom,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                          color: controller.canContinue
                              ? null
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          onPressed: controller.canContinue
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SelectionInterestScreen(),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            disabledBackgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            disabledForegroundColor: Colors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          );
        });
  }
}
