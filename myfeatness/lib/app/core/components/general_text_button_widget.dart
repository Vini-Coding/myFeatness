import 'package:flutter/material.dart';

class GeneralTextButtonWidget extends StatelessWidget {
  const GeneralTextButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xffFF6A6A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Staatliches',
            fontSize: 35,
            color: Color(0xFFFFFFFF),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}