import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/forms/ui/forms_page.dart';
import 'package:myfeatness/app/features/home/ui/home_page.dart';
import 'package:myfeatness/app/features/intro/ui/intro_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.isFirstEntry,
  });
  final bool isFirstEntry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstEntry ? IntroPage.routeName : HomePage.routeName,
      routes: {
        IntroPage.routeName: (context) => const IntroPage(),
        HomePage.routeName: (context) => const HomePage(),
        FormsPage.routeName: (context) => const FormsPage(),
      },
    );
  }
}
