import 'package:flutter/material.dart';

class IntroDotsIndicatorWidget extends StatelessWidget {
  const IntroDotsIndicatorWidget({
    this.isActive = false,
    super.key,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 20 : 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffFF6A6A) : const Color(0xffFF6A6A).withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}