import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/screens/dashboard_screen/chat_screen.dart';
import 'package:frnd_app/screens/dashboard_screen/connect_screen.dart';
import 'package:frnd_app/controller/dashboard_controller.dart';
import 'package:frnd_app/screens/dashboard_screen/home_screen.dart';
import 'package:frnd_app/screens/dashboard_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class DashBoardScreen extends StatelessWidget {
  final List<Widget> pages = [
    HomeScreen(),
    ConnectScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashBoardController(),
        builder: (controller) {
          return Obx(
            () => Scaffold(
              body: IndexedStack(
                index: controller.selectedIndex.value,
                children: pages,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.selectedIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: controller.selectedIndex.value == 0
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
                        color: controller.selectedIndex.value == 0
                            ? null
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.home,
                        color: controller.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: controller.selectedIndex.value == 1
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
                        color: controller.selectedIndex.value == 1
                            ? null
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.phone,
                        color: controller.selectedIndex.value == 1
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    label: "Connect",
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: controller.selectedIndex.value == 2
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
                        color: controller.selectedIndex.value == 2
                            ? null
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.chat,
                        color: controller.selectedIndex.value == 2
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    label: "Chat",
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: controller.selectedIndex.value == 3
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
                        color: controller.selectedIndex.value == 3
                            ? null
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.person,
                        color: controller.selectedIndex.value == 3
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
