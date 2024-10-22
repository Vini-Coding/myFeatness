import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/forms/provider/forms_provider.dart';

class FormsDesktopPage extends StatefulWidget {
  const FormsDesktopPage({
    super.key,
    required this.provider,
  });
  final FormsProvider provider;

  @override
  State<FormsDesktopPage> createState() => _FormsDesktopPageState();
}

class _FormsDesktopPageState extends State<FormsDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
