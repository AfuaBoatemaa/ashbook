import 'package:flutter/material.dart';
import 'package:social_app/LogIn.dart';
import 'package:social_app/Posts.dart';
import 'package:social_app/SignUp.dart';
import 'package:social_app/ViewProfile.dart';
import 'package:social_app/createpost.dart';
import 'package:social_app/landing.dart';
import 'package:social_app/profile.dart';
import 'package:provider/provider.dart';
import 'package:social_app/provider.dart';

import 'edit.dart';
// import 'home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD9YbdLva8HOujboDsun1qStn2WOLd5_Ck",
          authDomain: "final-project-a1903.firebaseapp.com",
          projectId: "final-project-a1903",
          storageBucket: "final-project-a1903.appspot.com",
          messagingSenderId: "1096713254445",
          appId: "1:1096713254445:web:853d3671ee80efe6a86aa4",
          measurementId: "G-1V3X2NL8E3"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (_) => MyProvider(),
      child: MaterialApp(
        title: 'AshBook',
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
