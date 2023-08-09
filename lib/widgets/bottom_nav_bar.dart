import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/discover_screen.dart';
import 'package:news/screens/settings_screen.dart';
import '../screens/home_screen.dart';
import '../globals.dart' as globals;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key,
  required this.index
  }) : super(key: key);

  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  Color selected_background_color = Colors.white;
  Color selected_text_color = Colors.black;
  @override
  Widget build(BuildContext context) {

    if(globals.isDarkMode){
      selected_background_color = globals.dark_mode_background;
      selected_text_color = globals.dark_mode_text_color;

    }else{
      selected_background_color = Colors.white;
      selected_text_color = Colors.black;

    }

    return BottomNavigationBar(
      backgroundColor: selected_background_color,
      currentIndex: widget.index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: selected_text_color,
      unselectedItemColor: Colors.black.withAlpha (100),


      items: [
        BottomNavigationBarItem(
            icon: Container(
              // margin: const EdgeInsets.only (left: 50),
              child: IconButton(

                  focusColor: Colors.grey,


                  onPressed: () {


                    if(widget.index != 0){
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName);


                    }

                  },
                  icon: const Icon (Icons. home)
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {

                  if(widget.index != 1){

                    Navigator.pushNamed(context, DiscoverScreen.routeName);


                  }
                },
                icon: const Icon (Icons. search)
            ),
            label: 'search'
        ),

        BottomNavigationBarItem(
            icon: Container(

              margin: const EdgeInsets.only (right: 50),
              child: IconButton(

                  focusColor: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, SettingsPage.routeName);
                  },
                  icon: const Icon (Icons. settings)
              ),
            ),
            label: 'profile'
        ),




      ],
    );




  }
}
