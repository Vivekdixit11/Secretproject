import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:secret_pr/bottombarinitalpage/bottombarpage.dart';
import 'package:secret_pr/firebase_options.dart';

import 'package:secret_pr/pages/loginscreen.dart';
import 'package:secret_pr/pages/registerscreen.dart';
import 'package:secret_pr/pages/welcomescreen.dart';
import 'package:secret_pr/payment/payment.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 178, 193, 203),
      ),
      initialRoute: welcomeScreen.id,
      routes: {
        welcomeScreen.id: (context) => const welcomeScreen(),
        bottombar.id: (context) => const bottombar(),
        registerpage.id: (context) => const registerpage(),
        loginscreen.id: (context) => const loginscreen(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
