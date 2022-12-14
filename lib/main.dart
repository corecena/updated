import 'package:flutter/material.dart';
import 'package:miic/auth/main_page.dart';
import 'package:miic/pages/bottom_bar.dart';

import 'package:miic/payments/abdul.dart';
import 'package:miic/pages/upcoming_matches.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Nunito"
      ),
      home: BotoomBar(),
      
    );
  }
}






 

