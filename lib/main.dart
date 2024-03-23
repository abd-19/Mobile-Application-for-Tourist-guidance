// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'package:app/cities/Erbil.dart';
import 'package:app/cities/baghdad.dart';
import 'package:app/cities/karbala.dart';
import 'package:app/feature/CurrencyExchangesPage.dart';
import 'package:app/feature/ExplorePage.dart';
import 'package:app/feature/ToDoListPage.dart';
import 'package:app/feature/TranslatorPage.dart';
import 'package:app/feature/booking.dart';
import 'package:app/feature/sharing.dart';
import 'package:app/home/HomePage.dart';
import 'package:app/home/ProfileScreen.dart';
import 'package:app/sign/LoginPage.dart';
import 'package:app/sign/SignUpPage.dart';
import 'package:app/welcome_page/introScreen.dart';
import 'package:app/welcome_page/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDzzPQ_kDjuQcmdbME-NnEfPhH-Tl_hsOY',
      appId: 'com.example.app',
      messagingSenderId: '125409601793',
      projectId: 'toruist-app',
      storageBucket: 'toruist-app.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/translator': (context) => TranslatorPage(),
        '/exchange_rate': (context) => CurrencyExchangesPage(),
        '/todo_list': (context) => ToDoListpage(),
        '/discover': (context) => ExplorePage(),
        '/login': (context) => LoginPage(),
        '/baghdad': (context) => BaghdadDetailsScreen(),
        '/erbil': (context) => ErbilDetailsScreen(),
        '/karbala': (context) => karbalaDetailsScreen(),
        '/booking': (context) => HotelListScreen(),
        '/PostPage': (context) => PostPage(),
      },
    );
  }
}
