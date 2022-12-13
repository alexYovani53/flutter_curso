import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/dd/cast.dart';
import 'package:peliculas/models/dd/cast_response.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/util/app_config.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> onDisplayMovies = [];
  List<Movie> popular = [];

  int _popularPage = 1;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<int, List<Cast>> castList = {};

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

  Future<String> _getJsonData(String route, [int page = 1]) async {
    var url = Uri.https(
      AppConfig.shared.urlBase,
      route,
      {'api_key': AppConfig.shared.keyApi, 'language': AppConfig.shared.languaje, 'page': '$page'},
    );
    var response = await http.get(url);
    return response.body;
  }
}
