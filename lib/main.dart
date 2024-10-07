import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'presentation/main_view.dart';
import 'utils/constants.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized before Firebase
  await Firebase.initializeApp(             // Initialize Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: fontFamily,
      ),
      home: MainViewScreen(),
      getPages: [
        GetPage(name: "/main_view_screen", page:()=> MainViewScreen())
      ],
    );
  }
}

