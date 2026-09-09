import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frnd_app/controller/choose_interest_controller.dart';
import 'package:frnd_app/model/InterestModel.dart';
import 'package:get/get.dart';

class ConversationCard extends StatelessWidget {
  final InterestModel item;

  ConversationCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseInterestController>(builder: (controller) {
      return Obx(() {
        final selected = controller.isSelectionSelected(item.title);

        return GestureDetector(
          onTap: () {
            controller.toggleSelectionInterest(item.title);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: selected ? const Color(0xffF3EAFF) : Colors.white,
              border: Border.all(
                color: selected ? Colors.deepPurple : Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: Text(item.emoji),
                      ),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected
                              ? Colors.deepPurple
                              : Colors.grey.shade200,
                        ),
                        child: selected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              )
                            : null,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.subtitle ?? "",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
