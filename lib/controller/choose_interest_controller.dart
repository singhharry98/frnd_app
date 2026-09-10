import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/InterestModel.dart';

class ChooseInterestController extends GetxController {
  final ImagePicker picker = ImagePicker();

  Rx<File?> profileImage = Rx<File?>(null);

  final interests = [].obs;

  final RxList<String> selected = <String>[].obs;
  final RxList<String> selectedSelectionInterest = <String>[].obs;

  final conversations = <InterestModel>[
    InterestModel(
      title: "Casual Chats",
      subtitle: "Chill, fun conversations",
      emoji: "😂",
    ),
    InterestModel(
      title: "Music Lovers",
      subtitle: "Share playlists & artists",
      emoji: "🎵",
    ),
    InterestModel(
      title: "Gaming",
      subtitle: "Talk games & go head-to-head",
      emoji: "🎮",
    ),
    InterestModel(
      title: "Movies & Shows",
      subtitle: "Reviews, spoilers & recs",
      emoji: "🎬",
    ),
    InterestModel(
      title: "Coffee Talks",
      subtitle: "Deep chats, big ideas",
      emoji: "☕",
    ),
    InterestModel(
      title: "Travel Stories",
      subtitle: "Share adventures & tips",
      emoji: "🌍",
    ),
    InterestModel(
      title: "Book Club",
      subtitle: "Discuss your favourite books",
      emoji: "📚",
    ),
    InterestModel(
      title: "Career & Business",
      subtitle: "Networking & growth",
      emoji: "💼",
    ),
  ].obs;

  void toggle(String title) {
    if (selected.contains(title)) {
      selected.remove(title);
    } else {
      selected.add(title);
    }
  }

  bool isSelected(String title) {
    return selected.contains(title);
  }

  int get selectedCount => selected.length;

  bool get canContinue => selected.length >= 5;

  void toggleSelectionInterest(String title) {
    if (selectedSelectionInterest.contains(title)) {
      selectedSelectionInterest.remove(title);
    } else {

    }
  }

  bool isSelectionSelected(String title) {
    return selectedSelectionInterest.contains(title);
  }

  int get selectedSelectionCount => selectedSelectionInterest.length;

  bool get canSelectionContinue => selectedSelectionInterest.length >= 5;

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );


  }

  void showImagePicker(ChooseInterestController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                controller.pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Gallery"),
              onTap: () {
                Get.back();
                controller.pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
