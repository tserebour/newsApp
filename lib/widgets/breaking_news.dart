import 'package:flutter/material.dart';
import 'package:news/screens/article_screen.dart';

import '../models/article.dart';
import 'custom_tag.dart';
import 'image_container.dart';
import '../globals.dart' as globals;

class BreakingNews extends StatefulWidget {
  const BreakingNews({
    Key? key,
    required this.articles


  }) : super(key: key);

  final List<Article>  articles;

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
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
    return Container(
      color: selected_background_color,
      child: (
        Padding(

          padding: EdgeInsets.all(20),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Breaking News',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: selected_text_color
                    ),


                  ),
                  Text(
                    'More>>>',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: selected_text_color

                    ),


                  )
                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: widget.articles.length,

                    itemBuilder: (context, index){

                      return Container(
                        width: MediaQuery.of(context).size.width * 0.5,

                        margin: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(
                                context,
                                ArticleScreen.routeName,
                              arguments: widget.articles[index]
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageContainer(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  imageUrl: widget.articles[index].imageUrl
                              ),
                              SizedBox(height: 10,),

                              Text(
                                widget.articles[index].title,
                                maxLines:2,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: selected_text_color,
                                    height: 1.5
                                ),
                              ),

                              SizedBox(height: 5,),

                              Text(
                                // '${DateTime.now().difference(articles[index].date).inHours} hours ago',
                                  widget.articles[index].date,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: selected_text_color,
                                    height: 1.5
                                ),




                              ),

                              SizedBox(height: 5,),

                              Text(
                                widget.articles[index].author,

                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: selected_text_color,
                                    height: 1.5
                                ),




                              ),
                            ],
                          ),
                        ),

                      );
                    }

                ),
              )

            ],
          ),
        )
      ),
    );
  }
}
