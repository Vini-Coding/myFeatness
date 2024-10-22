import 'package:flutter/material.dart';

class GeneralTextButtonWidget extends StatelessWidget {
  const GeneralTextButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.width,
  });
  final void Function() onTap;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: width ?? 0,
        decoration: BoxDecoration(
          color: const Color(0xFFFF3333),
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
