import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article.dart';

import '../widgets/bottom_nav_bar.dart';
import '../globals.dart' as globals;
import '../widgets/image_container.dart';
import 'article_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = "/searchScreen";


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List articles = globals.searches_results;
  String keyword = '';
  List<String>tabs = ['Results'];
  Color selected_background_color = Colors.white;
  Color selected_text_color = Colors.black;

  bool submitted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('init');
  }

  @override
  Widget build(BuildContext context) {

    if(globals.isDarkMode){
      selected_background_color = globals.dark_mode_background;
      selected_text_color = globals.dark_mode_text_color;

    }else{
      selected_background_color = Colors.white;
      selected_text_color = Colors.black;

    }

    List <String> tabs = ['Results'];

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

        bottomNavigationBar: BottomNavBar(index: 0,),

        body: Container(
          color: selected_background_color,
          child: ListView(

              padding: const EdgeInsets.all(20),
              children: [
                SizedBox(

                  height: MediaQuery.of(context).size.height * 0.25,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'Search',

                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: selected_text_color
                        ),
                      ),
                      SizedBox(height: 5,),

                      Text(
                        'News in categories from around the world',

                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: selected_text_color
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextFormField(

                        onFieldSubmitted: (value){
                          if(value.length > 0){

                            keyword = value;
                            print(keyword);
                            submitted = true;

                            setState(() {

                            });

                          }



                          // showSearch(context: context, delegate: CustomSearchDelegate());
                        },
                        decoration: InputDecoration(
                            hintText: 'search',
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: RotatedBox(

                              quarterTurns: 1,
                              child: const Icon(
                                Icons.tune,
                                color: Colors.grey,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none



                            )
                        ),
                      )
                    ],

                  ),
                ),

                FutureBuilder(
                    future: fetchSearchResults(keyword),
                    builder: (context, snapshot) {

                        if(keyword.length > 0) {

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();

                          }else if(snapshot.connectionState == ConnectionState.done){
                            String newString = snapshot.data.toString().replaceAll('null', '" "');
                            var articles = jsonDecode(newString);


                            articles = articles['articles'];
                            print(articles.length);



                            return ListView.builder(


                                scrollDirection: Axis.vertical,
                                itemCount: articles.length,
                                shrinkWrap: true,
                                controller: ScrollController(

                                ),

                                itemBuilder: (context, index){



                                  return Container(

                                    width: MediaQuery.of(context).size.width,

                                    margin: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      onTap: (){
                                        String url = articles[index]['url']??'null';
                                        String title = articles[index]['title']??'null';
                                        String content = articles[index]['content']??'null';
                                        String author = articles[index]['author']??'null';
                                        String date = articles[index]['publishedAt']??'null';
                                        String time = articles[index]['publishedAt']??'null';
                                        String imageUrl = articles[index]['urlToImage']??'null';
                                        Article article = Article(url: url, title: title, content: content, author: author, time: time, imageUrl: imageUrl, date: date);

                                        Navigator.pushNamed(
                                            context,
                                            ArticleScreen.routeName,
                                            arguments: article
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ImageContainer(
                                              width: MediaQuery.of(context).size.width,
                                              imageUrl: articles[index]['urlToImage']??'null'
                                          ),
                                          SizedBox(height: 10,),

                                          Text(
                                            articles[index]['title'],
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
                                            articles[index]['publishedAt']??'null',
                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: selected_text_color,
                                                height: 1.5
                                            ),




                                          ),

                                          SizedBox(height: 5,),

                                          Text(
                                            articles[index]['author']??'null',


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

                            );

                        }



                        }
                        







                        


                        


                        return Container(


                        );




                    },
                )


              ]
          ),
        ),
      ),
    );
  }
}


Future  fetchSearchResults(String keyword) async {

  if(keyword.length > 1){

    String search_server =  "https://newsapi.org/v2/everything?q=${keyword}&apiKey=${globals.api_key}";
    print(search_server);
    final response = await http
        .get(Uri.parse(search_server));

    // print('response is ${response.body.toString()}');






    if(keyword.isEmpty){
      return '';
    }

    if (response.statusCode == 200) {
      print('in ${keyword}');
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Article article = jsonDecode(response.body);
      // print(jsonDecode(response.body)['data']);

      String data = response.body.toString().replaceAll('null', '""');

      return (data);





    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }









}