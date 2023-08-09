import 'package:flutter/material.dart';
import 'package:news/screens/article_screen.dart';
import 'package:news/widgets/image_container.dart';

import '../models/article.dart';
import '../globals.dart' as globals;

class CartegoryNews extends StatefulWidget {
   const CartegoryNews({
    Key? key,

    required this.tabs

  }) : super(key: key);



  final List<String> tabs;

  @override
  State<CartegoryNews> createState() => _CartegoryNewsState();
}

class _CartegoryNewsState extends State<CartegoryNews> {

  Color selected_background_color = Colors.white;
  Color selected_text_color = Colors.black;

  List articles = globals.articles;
  @override
  Widget build(BuildContext context) {

    if(globals.isDarkMode){
      selected_background_color = globals.dark_mode_background;
      selected_text_color = globals.dark_mode_text_color;

    }else{
      selected_background_color = Colors.white;
      selected_text_color = Colors.black;

    }





    return Column(
      children:  [
        TabBar(
            isScrollable: true,
          onTap: (index) {

            if(index == 0){
              this.articles = globals.articles;
              setState(() {




              });


            }else if(index == 1){
              this.articles = globals.business;
              setState(() {



              });


            }else if(index == 2){
              this.articles = globals.politics;

              setState(() {



              });

            }else if(index == 3){
              this.articles = globals.technology;
              setState(() {



              });

            }else{
              this.articles = globals.science;
              setState(() {



              });
            }


          },


            indicatorColor:  selected_text_color,
            tabs: widget.tabs
                .map(

                    (tab) => Tab(

                      icon: Text(

                        tab,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight:  FontWeight.bold,
                            color: selected_text_color

                        ),
                      ),

                    )
            ).toList(),

        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(

            children: widget.tabs
                .map(
                    (tab) => ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {

                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(
                                context,
                                ArticleScreen.routeName,
                                arguments: articles[index]
                            );
                          },
                          child: Row(
                            children: [
                              ImageContainer(
                                  height: 80,
                                  width: 80,
                                  borderRadius: 5,
                                  margin: const EdgeInsets.all(10),
                                  imageUrl: articles[index].imageUrl
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: selected_text_color
                                      ),
                                    ),

                                  ],
                                ),
                              )

                            ],
                          ),
                        );

                      },

                    )

            ).toList()
            ,

          ),
        ),


      ],
    );
  }
}
