import 'package:flutter/material.dart';

class IntroPageWidget extends StatefulWidget {
  const IntroPageWidget({
    required this.title,
    required this.assetImage,
    required this.description,
    super.key,
  });
  final String title;
  final String assetImage;
  final String description;

  @override
  State<IntroPageWidget> createState() => _IntroPageWidgetState();
}

class _IntroPageWidgetState extends State<IntroPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 45,
                  color: Color(0xFFFFFFFF),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Image(
                image: AssetImage(widget.assetImage),
              ),
              const SizedBox(height: 50),
              Text(
                widget.description,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
