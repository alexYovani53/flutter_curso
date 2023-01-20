import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/pages/details_page.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{


  Widget get _emptyResult => Container(
        child: const Center(
          child: Icon(Icons.movie_creation, color: Colors.black38, size: 100,),
        ),
      );

  @override
  String? get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {  
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear, color: Colors.red))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back, color: Colors.black));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('texto');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyResult;
    }

    final moviesProvider = Provider.of<MovieProvider>(context);
    moviesProvider.getSuggestionsByquery(query);
    
    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyResult;
        final movies = snapshot.data;
        return ListView.builder(
          itemCount: movies!.length,
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]) ,
        );
      }
    );
  }
}


class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return Hero(
      tag: movie.heroId!,
      child: ListTile(
        leading: FadeInImage(
          placeholder: const AssetImage("assets/no-image.jpg"),
          image: NetworkImage(movie.fullImage),
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(movie.title!),
        subtitle: Text(movie.originalTitle!),
        onTap: () => Navigator.pushNamed(context, DetailsPage.routeName,arguments: movie),
      ),
    );
  }
}