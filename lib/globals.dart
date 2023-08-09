library news.globals;


import 'package:flutter/material.dart';

import 'models/article.dart';

List<Article> articles = [];
List<Article> business = [];
List<Article> politics = [];
List<Article> technology = [];
List<Article> science = [];
List<Article> searches_results = [];

String articles_ = '';
String business_ = '';
String politics_ = '';
String technology_ = '';
String science_ = '';

String search_text =  "";
String user_language = "us";
String api_key =  "62782117b23a4790aad7278e1b43964b";
// String api_key =  "31d61b7628ff45d381068a98ad6d8597";
String default_headline_server =  "https://newsapi.org/v2/top-headlines?country=${user_language}&apiKey=${api_key}";
String bussiness_headline_server =  "https://newsapi.org/v2/top-headlines?country=${user_language}&category=business&apiKey=${api_key}";
String politics_headline_server =  "https://newsapi.org/v2/top-headlines?country=${user_language}&category=politics&apiKey=${api_key}";
String science_headline_server =  "https://newsapi.org/v2/top-headlines?country=${user_language}&category=science&apiKey=${api_key}";
String technology_headline_server =  "https://newsapi.org/v2/top-headlines?country=${user_language}&category=technology&apiKey=${api_key}";
String query_server =  "https://newsapi.org/v2/everything?q=bitcoin&apiKey=${api_key}";

bool isDarkMode = false;
Color dark_mode_background = const Color.fromRGBO(30, 30, 30, 1);
Color dark_mode_text_color = Colors.white;


