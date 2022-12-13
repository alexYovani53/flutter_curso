import 'dates.dart';
import 'movie.dart';

class PopularResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  PopularResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
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
