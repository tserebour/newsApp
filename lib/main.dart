
import 'package:flutter/material.dart';
import 'package:news/models/user.dart';
import 'package:news/screens/article_screen.dart';
import 'package:news/screens/discover_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/screens/settings_screen.dart';
import 'package:news/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'globals.dart' as globals;

import 'models/article.dart';

void main()  {

  WidgetsFlutterBinding.ensureInitialized();


  User.setIsDarkMode(true);

  Future<void> loadPreference() async {




    // String language = User.getLanguage() as String;
    Future<String> language = User.getLanguage();
    String user_language = await language;

    Future<bool?> dark_mode = User.getIsDarkMode();
    bool? user_dark_mode = await dark_mode;

    globals.isDarkMode = user_dark_mode!;
    print('global is dark: ${globals.isDarkMode}');






  }

  loadPreference();


  runApp (const MyApp());
}










class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {





        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          // ThemeData
          initialRoute: '/loading',
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            DiscoverScreen.routeName: (context) => const DiscoverScreen(),
            ArticleScreen.routeName: (context) => const ArticleScreen(),
            SettingsPage.routeName: (context) => SettingsPage(),
            SearchScreen.routeName: (context) => SearchScreen(),


          },
        ); // MaterialApp
      }
}
