import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_module/features/homepage/homepage_view.dart';
import 'package:test_module/features/homepage/homepage_view_model.dart';
import 'package:test_module/features/level_map/level_bg_exam.dart';
import 'package:test_module/features/level_map/ex_level_map_view.dart';
import 'package:test_module/features/level_map/level_sc.dart';
import 'package:test_module/features/level_map/my_level_exam.dart';
import 'package:test_module/features/level_map/snake_path_painter.dart';
import 'package:test_module/features/login/login_view.dart';
import 'package:test_module/features/test/resfebe_view.dart';
import 'package:test_module/firebase_options.dart';


import 'package:test_module/features/login/login_view_model.dart';
import 'features/ex_level/level_view_model.dart';
import 'features/level_map/level_map_view.dart';
import 'firebase_options.dart';
import 'features/mascot/mascot_view.dart';
import 'features/test/test_view.dart';
import 'features/test/test_view_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TestViewModel()),
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => HomepageViewModel()),
      ChangeNotifierProvider(create: (_) => LevelViewModel()),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Module',
      theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePageView(),
    );
  }
}

