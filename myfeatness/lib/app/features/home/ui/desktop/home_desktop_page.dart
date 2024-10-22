import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/home/provider/home_provider.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({
    super.key,
    required this.provider,
  });
  final HomeProvider provider;

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
