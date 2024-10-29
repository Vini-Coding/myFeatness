import 'package:flutter/material.dart';
import 'package:myfeatness/app/core/components/responsive_layout_builder.dart';
import 'package:myfeatness/app/features/home/providers/home_provider.dart';
import 'package:myfeatness/app/features/home/ui/desktop/home_desktop_page.dart';
import 'package:myfeatness/app/features/home/ui/mobile/home_mobile_page.dart';
import 'package:myfeatness/app/features/home/ui/tablet/home_tablet_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = context.watch<HomeProvider>();

    return Scaffold(
      body: ResponsiveLayoutBuilder(
        mobile: HomeMobilePage(provider: provider),
        tablet: HomeTabletPage(provider: provider),
        desktop: HomeDesktopPage(provider: provider),
      ),
    );
  }
}
