import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/controller/choose_interest_controller.dart';
import 'package:frnd_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widgets/conversation_card.dart';
import '../../utils/colors.dart';
import 'create_profile_header.dart';

class SelectionInterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseInterestController>(
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
                      currentStep: 3,
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
                    "Pick at least 3 interests so we can match you with people you'll actually vibe with.",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Text(
                      "${controller.selectedSelectionCount} / 3 selected",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Container(
                  //       padding:
                  //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //       decoration: BoxDecoration(
                  //         color: const Color(0xffF4F4F8),
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       child:  Text(
                  //         "${controller.selectedSelectionCount} / 3 selected",
                  //       )
                  //     ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(
                      () => GridView.builder(
                        itemCount: controller.conversations.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: .82,
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.conversations[index];

                          return ConversationCard(
                            item: item,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Obx(
                    () {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 58,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColor.gradientColorTop,
                                AppColor.gradientColorCenter,
                                AppColor.gradientColorBottom,
                              ],
                              begin: Alignment.topLeft,
                            ),
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashBoardScreen(),
                                ),
                              );
                            },
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
                      );
                    },
                  ),
                ],
              ),
            )),
          );
        });
  }
}
