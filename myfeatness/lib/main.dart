import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfeatness/app/app_widget.dart';
import 'package:myfeatness/app/core/local_storage/first_entry_adapter.dart';
import 'package:myfeatness/app/core/local_storage/user_profile_adapter.dart';
import 'package:myfeatness/app/features/forms/provider/forms_provider.dart';
import 'package:myfeatness/app/features/home/provider/home_provider.dart';
import 'package:myfeatness/app/features/home/repository/home_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  // Hive settings
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserProfileAdapter());
  await FirstEntryAdapter.initSettings();
  bool isFirstEntry = await FirstEntryAdapter.isFirstEntry();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FormsProvider>(create: (_) => FormsProvider()),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(repository: HomeRepository()),
        ),
      ],
      child: AppWidget(
        isFirstEntry: isFirstEntry,
      ),
    ),
  );
}
