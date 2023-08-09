import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/widgets/image_container.dart';
import 'package:news/widgets/news_headline.dart';
import '../globals.dart' as globals;
import '../models/article.dart';
import '../widgets/custom_tag.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);
  static const routeName = "/article_screen";

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

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
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return ImageContainer(
        width: double.infinity,
        imageUrl: article.imageUrl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors. transparent,
            elevation: 0,
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.menu,
            //     color: Colors.white,
            //   ), // Icon
            // ), // IconButton


          ),
          extendBodyBehindAppBar: true,
          body: ListView(

            children: [
              NewsHeadline(
                article: article,
              ),

              Container(


                decoration:  BoxDecoration(
                    color: selected_background_color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                  )
                ),



                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CustomTag(
                          backgroundColor: selected_text_color,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(article.imageUrl),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              article.author,
                              style: Theme.of (context).textTheme.bodyMedium!. copyWith(
                                color: selected_background_color,
                              ),
                            ), // Text
                          ]

                      ),
                      SizedBox(height: 20,),

                      Text(
                        article.title,
                        style: Theme.of (context).textTheme.headlineSmall!. copyWith(
                            color: selected_text_color,
                            fontWeight: FontWeight.bold
                        ),

                      ),

                      SizedBox(height: 20,),

                      Text(
                        article.content,
                        style: Theme.of (context).textTheme.bodyMedium!. copyWith(
                            color: selected_text_color,
                            height: 1.5
                        ),

                      ),


                    ],
                  ),
                ),


              )


            ],
          )
        ),
    );
  }
}
