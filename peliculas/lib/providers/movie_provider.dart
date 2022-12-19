import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/cast_models/cast.dart';
import 'package:peliculas/models/cast_models/cast_response.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/models/search_response.dart';
import 'package:peliculas/util/app_config.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> onDisplayMovies = [];
  List<Movie> popular = [];

  int _popularPage = 1;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<int, List<Cast>> castList = {};

  final debouncer = Debouncer(duration: const Duration(milliseconds: 800));
  final StreamController<List<Movie>> _suggestionStreamControoler = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionStreamControoler.stream;

  MovieProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var response = await _getJsonData("3/movie/now_playing");
    final Map<String, dynamic> decodedData = json.decode(response);
    final nowPlayingResponse = NowPlayingResponse.fromJson(decodedData);
    onDisplayMovies = nowPlayingResponse.results!;
    notifyListeners();
  }

  getPopularMovies() async {
    _isLoading = true;
    notifyListeners();
    _popularPage++;
    final response = await _getJsonData("3/movie/popular", _popularPage);
    final Map<String, dynamic> decodedData = json.decode(response);
    final popularResponse = NowPlayingResponse.fromJson(decodedData);
    popular = [...popular, ...popularResponse.results!];
    _isLoading = false;
    notifyListeners();
  }

  Future<List<Cast>> getCast(int movieId) async {
    if (castList.containsKey(movieId)) {
      return castList[movieId]!;
    }
    final response = await _getJsonData("3/movie/$movieId/credits");
    final jsonData = json.decode(response);
    final castResponse = CastREsponse.fromJson(jsonData);
    castList[movieId] = castResponse.cast;
    return castResponse.cast;
  }

  Future<List<Movie>> getBySearch(String query, [int? page = 1]) async {
    if (query.isEmpty) return [];
    final uri = Uri.https(
      AppConfig.shared.urlBase,
      '3/search/movie',
      {'api_key': AppConfig.shared.keyApi, 'language': AppConfig.shared.languaje, 'page': '$page', 'query': query},
    );
    final response = await http.get(uri);
    print(response.body);

    final jsonData = json.decode(response.body);
    final searchResponse = SearchResponse.fromJson(jsonData);

    return searchResponse.results!;
  }

  Future<String> _getJsonData(String route, [int page = 1]) async {
    final url = Uri.https(
      AppConfig.shared.urlBase,
      route,
      {'api_key': AppConfig.shared.keyApi, 'language': AppConfig.shared.languaje, 'page': '$page'},
    );
    var response = await http.get(url);
    return response.body;
  }

  void getSuggestionsByquery(String query){
    debouncer.value = "";
    debouncer.onValue =(value) async {
      print("Tenemos valor a buscar: $query");
      final result = await getBySearch(value);
      _suggestionStreamControoler.add(result);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
    
  }
}
