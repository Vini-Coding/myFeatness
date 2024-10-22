import 'package:flutter/material.dart';
import 'package:myfeatness/app/core/components/responsive_layout_builder.dart';
import 'package:myfeatness/app/features/forms/provider/forms_provider.dart';
import 'package:myfeatness/app/features/forms/ui/desktop/forms_desktop_page.dart';
import 'package:myfeatness/app/features/forms/ui/mobile/forms_mobile_page.dart';
import 'package:myfeatness/app/features/forms/ui/tablet/forms_tablet_page.dart';
import 'package:provider/provider.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});
  static String routeName = '/forms';

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    final FormsProvider provider = context.watch<FormsProvider>();

    return Scaffold(
      body: Expanded(
        child: ResponsiveLayoutBuilder(
          mobile: FormsMobilePage(provider: provider),
          tablet: FormsTabletPage(provider: provider),
          desktop: FormsDesktopPage(provider: provider),
        ),
      ),
    );
  }
}
