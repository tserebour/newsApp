
import 'package:flutter/material.dart';
import 'package:news/widgets/bottom_nav_bar.dart';
import 'package:news/widgets/breaking_news.dart';
import 'package:news/widgets/new_of_the_day.dart';
import '../globals.dart' as globals;





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}): super(key: key);
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build (BuildContext context) {




  // Article.fetchAllNews();


    if(globals.articles.length < 1){
      return Container(
        child: Text(
          'error loading articles'
        ),
      );
    }
    var article = globals.articles[1];
    return Scaffold (
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ), // Icon
        ), // IconButton


      ),

      bottomNavigationBar: BottomNavBar(index: 0,),
      extendBodyBehindAppBar: true,
      body: ListView(

          padding: EdgeInsets.zero,
          children: [

            NewsOfTheDay(
              article: article,
            ),
            BreakingNews(articles: globals.articles,)




    ]),
    );
}
}



