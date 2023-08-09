import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart' as globals;

class User{

  String user_language = 'en';
  bool dark_mode = false;


  static Future<void> setLanguage(String user_language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

      print(user_language);

      await prefs.setString('user_language', user_language);


  }

  static Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    String? userLanguage = prefs.getString('user_language');
    print(
      'user: ${userLanguage}'
    );
    globals.user_language = userLanguage!;

    return userLanguage;





  }

  static Future<void> setIsDarkMode(bool isDarkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    if(isDarkMode) {
      await prefs.setBool('isDarkMode', true);

    }else{
      await prefs.setBool('isDarkMode', false);

    }



  }

  static Future<bool?> getIsDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();



    bool? isDarkMode = await prefs.getBool('isDarkMode') ;
    print(isDarkMode);
    return isDarkMode;




  }








}