import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/home/ui/home_page.dart';
import 'package:myfeatness/app/features/home/ui/mobile/forms_mobile_page.dart';
import 'package:myfeatness/app/features/intro/ui/intro_page.dart';
import 'package:flutter/foundation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.isFirstEntry,
  });
  final bool isFirstEntry;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:
          (isFirstEntry && isMobile) ? IntroPage.routeName : HomePage.routeName,
      routes: {
        IntroPage.routeName: (context) => const IntroPage(),
        HomePage.routeName: (context) => const HomePage(),
        FormsMobilePage.routeName: (context) => const FormsMobilePage(),
      },
    );
  }
}
