import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/widgets/cartegory_news.dart';
import 'package:news/widgets/discover_news.dart';

import '../widgets/bottom_nav_bar.dart';

import '../globals.dart' as globals;

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = "/discover";

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {

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

    List <String> tabs = ['all','Business', 'politics', 'technology', 'Science'];

    return DefaultTabController(

      length: tabs.length,
      initialIndex: 0,
      child: Scaffold (
        appBar: AppBar(

          backgroundColor: Colors. transparent,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.menu,
          //     color: Colors.black,
          //   ), // Icon
          // ), // IconButton


        ),

        bottomNavigationBar: BottomNavBar(index: 1,),

        body: Container(
          color: selected_background_color,
          child: ListView(

              padding: const EdgeInsets.all(20),
              children: [
                DiscoverNews(front_text: 'Discover',),

                CartegoryNews(tabs: tabs)


              ]
          ),
        ),
      ),
    );
  }
}
