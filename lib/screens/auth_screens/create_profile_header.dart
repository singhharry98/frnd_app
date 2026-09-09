import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;

  const OnboardingHeader({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onBack,
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 16),
              SizedBox(width: 4),
              Text("Back"),
            ],
          ),
        ),
        Text(
          "Step $currentStep of $totalSteps",
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}