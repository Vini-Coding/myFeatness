import 'package:flutter/material.dart';
import 'package:myfeatness/app/app_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [],
      child: const AppWidget(),
    ),
  );
}
