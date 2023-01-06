import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/model/news_response.dart';

class NewsService with ChangeNotifier{

  final String _baseUrl = "newsapi.org";
  final String _pathUrl = "/v2/top-headlines";
  final String _key = "c0028d0690304ce2a1a622f27c88fdb0";
  String _selectedCategory = "business";
  
  String get selectedCategory => _selectedCategory;

  List<Article> get getArticulosCategoriaSeleccionada => categoryArticles[_selectedCategory]!;

  set selectedCategory(String value) {
    _selectedCategory = value;

    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> headlines = [];
  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyball, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = { };

  NewsService(){
    gettopHeadlines();
    for (var element in categories) {
      categoryArticles[element.name] = <Article>[];
    }
  }

  gettopHeadlines() async {
    final Uri url = Uri.https(
      _baseUrl,
      _pathUrl,
      { "apiKey":_key , "country":"us" },
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final newsResponse = NewsResponse.fromService(responseData);
      headlines.addAll(newsResponse.articles);
      notifyListeners();
    }
  } 

  void getArticlesByCategory( String category) async {

    if (categoryArticles[category]!.isNotEmpty ) return;
    final Uri url = Uri.https(
      _baseUrl,
      _pathUrl,
      { "apiKey":_key , "country":"us" , "category":category},
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final newsResponse = NewsResponse.fromService(responseData);
      categoryArticles[category] = newsResponse.articles;
      notifyListeners();
    }
  } 
}
