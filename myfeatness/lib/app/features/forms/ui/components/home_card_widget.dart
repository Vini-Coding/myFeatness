import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });
  final void Function() onTap;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 500,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/card.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 150,
              width: 500,
              decoration: BoxDecoration(
                color: const Color(0xFFFF3333).withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 40,
                        color: Color(0xFFFFFFFF),
                        height: 1,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
