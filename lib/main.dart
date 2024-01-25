import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_module/features/homepage/homepage_view.dart';
import 'package:test_module/features/homepage/homepage_view_model.dart';
import 'package:test_module/features/level/level_view.dart';
import 'package:test_module/features/level/level_view_model.dart';
import 'package:test_module/features/test/resfebe_view.dart';
import 'package:test_module/firebase_options.dart';


import 'package:test_module/features/login/login_view_model.dart';
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
      home:  ResfebeView(),
    );
  }
}

