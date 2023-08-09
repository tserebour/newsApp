import 'package:flutter/material.dart';
import 'package:news/models/user.dart';

import '../models/article.dart';
import '../globals.dart' as globals;
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    loadNewsAndNavigateHome();

  }



  loadNewsAndNavigateHome() async {
    await User.setLanguage(globals.user_language);


    await Article.fetchAllNews(globals.user_language);
    await Article.fetchBusinessNews(globals.user_language);
    await Article.fetchPoliticNews(globals.user_language);
    await Article.fetchScienceNews(globals.user_language);
    await Article.fetchTechnologyNews(globals.user_language);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            SizedBox(height: 16.0),
            Text(
              'News App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set the text color of the splash screen
              ),
            ),
            SizedBox(height: 16.0),

            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}