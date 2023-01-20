import 'dart:convert';

import 'article_model.dart';

class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  String toString() {
    return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  factory NewsResponse.fromService(Map<String, dynamic> data) => NewsResponse(
        status: data['status'] as String,
        totalResults: data['totalResults'] as int,
        articles: (data['articles'] as List<dynamic>)
            .map((e) => Article.fromMap(e))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles.map((e) => e.toMap()).toList(),
      };



  String toJson() => json.encode(toMap());
}
