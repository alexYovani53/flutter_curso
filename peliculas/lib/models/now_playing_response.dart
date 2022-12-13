import 'dates.dart';
import 'movie.dart';

class NowPlayingResponse {
  Dates? dates;
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  NowPlayingResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponse(
        dates: json['dates'] == null
            ? null
            : Dates.fromJson(json['dates'] as Map<String, dynamic>),
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e))
            .toList(),
        totalPages: json['total_pages'] as int?,
        totalResults: json['total_results'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'dates': dates?.toJson(),
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}
