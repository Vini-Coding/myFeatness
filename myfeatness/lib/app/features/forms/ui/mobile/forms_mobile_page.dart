import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/forms/provider/forms_provider.dart';

class FormsMobilePage extends StatefulWidget {
  const FormsMobilePage({
    super.key,
    required this.provider,
  });
  final FormsProvider provider;

  @override
  State<FormsMobilePage> createState() => _FormsMobilePageState();
}

class _FormsMobilePageState extends State<FormsMobilePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
