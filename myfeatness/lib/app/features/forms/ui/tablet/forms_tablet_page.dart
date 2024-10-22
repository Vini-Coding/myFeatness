import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/forms/provider/forms_provider.dart';

class FormsTabletPage extends StatefulWidget {
  const FormsTabletPage({
    super.key,
    required this.provider,
  });
  final FormsProvider provider;
  @override
  State<FormsTabletPage> createState() => _FormsTabletPageState();
}

class _FormsTabletPageState extends State<FormsTabletPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
