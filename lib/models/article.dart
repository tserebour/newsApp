

import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../globals.dart' as globals;

class Article extends Equatable {
  // final String id;
  final String title;

  final String content;
  final String author;


  final String imageUrl;
  final String url;
  final String date;
  final String time;

  const Article({
    // required this.id,
    required this.url,required this.title,  required this.content, required this.author, required this.time, required this.imageUrl, required this.date});








  static Future  fetchAllNews(String language) async {
    String default_headline_server =  "https://newsapi.org/v2/top-headlines?country=${language}&apiKey=${globals.api_key}";


    final response = await http
        .get(Uri.parse(default_headline_server));



    print(default_headline_server);


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

       // Article article = jsonDecode(response.body);
      // print(jsonDecode(response.body)['data']);
      // String newString = response.body.replaceAll('null', '""');
      print(response.body);

       List articles =  jsonDecode(response.body)['articles'];





       for(int i = 0; i < articles.length; i++){

          // String id = articles[i]['id'];
          String title = articles[i]['title']??'null';
          String content= articles[i]['content']??'null';
          String author= articles[i]['author']??'null';
          String imageUrl = articles[i]['urlToImage']??'null';
          String url= articles[i]['url']??'null';
          String date = articles[i]['publishedAt']??'null';
          String time = articles[i]['publishedAt']??'null';

         Article article = Article(
             // id: id,
             url: url, title: title, content: content, author: author, time: time, imageUrl: imageUrl, date: date);
         globals.articles.add(article);

       }


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future  fetchBusinessNews(String language) async {
    String bussiness_headline_server =  "https://newsapi.org/v2/top-headlines?country=${language}&category=business&apiKey=${globals.api_key}";

    final response = await http
        .get(Uri.parse(bussiness_headline_server));






    print(bussiness_headline_server);


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Article article = jsonDecode(response.body);
      // print(jsonDecode(response.body)['data']);
      // String newString = response.body.replaceAll('null', '""');
      print(response.body);

      List articles =  jsonDecode(response.body)['articles'];





      for(int i = 0; i < articles.length; i++){

        // String id = articles[i]['id'];
        String title = articles[i]['title']??'null';
        String content= articles[i]['content']??'null';
        String author= articles[i]['author']??'null';
        String imageUrl = articles[i]['urlToImage']??'null';
        String url= articles[i]['url']??'null';
        String date = articles[i]['publishedAt']??'null';
        String time = articles[i]['publishedAt']??'null';

        Article article = Article(
          // id: id,
            url: url, title: title, content: content, author: author, time: time, imageUrl: imageUrl, date: date);
        globals.business.add(article);

      }


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


  static Future  fetchPoliticNews(String language) async {

    String politics_headline_server =  "https://newsapi.org/v2/top-headlines?country=${language}&category=politics&apiKey=${globals.api_key}";

    final response = await http
        .get(Uri.parse(politics_headline_server));



    print(politics_headline_server);


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Article article = jsonDecode(response.body);
      // print(jsonDecode(response.body)['data']);
      // String newString = response.body.replaceAll('null', '""');
      print(response.body);

      List articles =  jsonDecode(response.body)['articles'];




      for(int i = 0; i < articles.length; i++){

        // String id = articles[i]['id'];
        String title = articles[i]['title']??'null';

        String content= articles[i]['content']??'null';

        String author= articles[i]['author']??'null';




        String imageUrl = articles[i]['urlToImage']??'null';
        String url= articles[i]['url']??'null';
        String date = articles[i]['publishedAt']??'null';
        String time = articles[i]['publishedAt']??'null';

        Article article = Article(
          // id: id,
            url: url, title: title, content: content, author: author, time: time, imageUrl: imageUrl, date: date);
        globals.politics.add(article);

      }


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future  fetchScienceNews(String language) async {

    String science_headline_server =  "https://newsapi.org/v2/top-headlines?country=${language}&category=science&apiKey=${globals.api_key}";


    final response = await http
        .get(Uri.parse(science_headline_server));



    print(science_headline_server);


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Article article = jsonDecode(response.body);
      // print(jsonDecode(response.body)['data']);
      // String newString = response.body.replaceAll('null', '""');
      print(response.body);

      List articles =  jsonDecode(response.body)['articles'];





      for(int i = 0; i < articles.length; i++){

        // String id = articles[i]['id'];
        String title = articles[i]['title']??'null';

        String content= articles[i]['content']??'null';

        String author= articles[i]['author']??'null';




        String imageUrl = articles[i]['urlToImage']??'null';
        String url= articles[i]['url']??'null';
        String date = articles[i]['publishedAt']??'null';
        String time = articles[i]['publishedAt']??'null';

        Article article = Article(
          // id: id,
            url: url, title: title, content: content, author: author, time: time, imageUrl: imageUrl, date: date);
        globals.science.add(article);

      }


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future  fetchTechnologyNews(String language) async {

    String technology_headline_server =  "https://newsapi.org/v2/top-headlines?country=${language}&category=technology&apiKey=${globals.api_key}";

    final response = await http
        .get(Uri.parse(technology_headline_server));



    print(technology_headline_server);


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Article article = jsonDecode(response.body);
      // print(jsonDecode(response.body)['data']);
      // String newString = response.body.replaceAll('null', '"null"');
      print(response.body);

      List articles =  jsonDecode(response.body)['articles'];





      for(int i = 0; i < articles.length; i++){

        // String id = articles[i]['id'];
        String title = articles[i]['title']??'null';

        String content= articles[i]['content']??'null';

        String author= articles[i]['author']??'null';




        String imageUrl = articles[i]['urlToImage']??'null';
        String url= articles[i]['url']??'null';
        String date = articles[i]['publishedAt']??'null';
        String time = articles[i]['publishedAt']??'null';

        Article article = Article(
          // id: id,
            url: url, title: title, content: content, author: author, time: time, imageUrl: imageUrl, date: date);
        globals.technology.add(article);

      }


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }






  @override

  List<Object?> get props => [
    // id,
    title,content,author,time,imageUrl,url,date
  ];
}