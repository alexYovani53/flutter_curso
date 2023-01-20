import 'movie.dart';

class SearchResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      SearchResponse(
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e))
            .toList(),
        totalPages: json['total_pages'] as int?,
        totalResults: json['total_results'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}
