import 'package:flutter/material.dart';
import 'package:news/models/user.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/splash_screen.dart';
import '../globals.dart' as globals;
import '../widgets/bottom_nav_bar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();

  static const routeName = '/settings';
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = globals.isDarkMode;
  String _selectedLanguage = globals.user_language;

  Color selected_background_color = Colors.white;
  Color selected_text_color = Colors.black;


  List<String> _languages = ['us', 'fr', 'de'];

  void _onLanguageChanged(String value) {
    setState(() {

      _selectedLanguage = value;

      print(_selectedLanguage);

    });
  }




  void _onDarkModeChanged(bool value) {
    globals.isDarkMode = value;
    User.setIsDarkMode(value);

    setState(() {
      User.setIsDarkMode(value);

      _darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {



    if(globals.isDarkMode == true) {
      selected_background_color = globals.dark_mode_background;
      selected_text_color = globals.dark_mode_text_color;
    }else{
       selected_background_color = Colors.white;
       selected_text_color = Colors.black;

    }


    return Scaffold(
      backgroundColor: selected_background_color,
      appBar: AppBar(
        title: Text('Settings'),
        leading: BackButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
        ),

      ),
      bottomNavigationBar: BottomNavBar(index: 2,),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selected_text_color
                ),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                selectedTileColor: selected_text_color,

                activeColor: Colors.green,

                title: Text(
                    'Dark Mode',
                  style: TextStyle(
                    color: selected_text_color
                  ),

                ),
                value: _darkMode,
                onChanged: _onDarkModeChanged,
              ),
              SizedBox(height: 16),
              Text(
                'Language',
                style: TextStyle(
                  color: selected_text_color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              DropdownButton<String>(
                value: _selectedLanguage,

                onChanged: (value){
                  print(value);
                  this._selectedLanguage = value!;
                  User.setLanguage(value);
                  globals.user_language = value;
                  globals.articles =[];
                  globals.science =[];
                  globals.politics =[];
                  globals.technology =[];
                  globals.business =[];

                  print(globals.articles);
                  Navigator.pushReplacementNamed(context, SplashScreen.routeName);




                  setState(() {

                  });


                },
                items: _languages.map((String value) {

                  return DropdownMenuItem<String>(


                    value: value,

                    child: Text(
                      value,
                      style: TextStyle(

                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
