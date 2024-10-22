import 'package:flutter/material.dart';
import 'package:myfeatness/app/features/home/provider/home_provider.dart';

class HomeTabletPage extends StatefulWidget {
  const HomeTabletPage({
    super.key,
    required this.provider,
  });
  final HomeProvider provider;

  @override
  State<HomeTabletPage> createState() => _HomeTabletPageState();
}

class _HomeTabletPageState extends State<HomeTabletPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
