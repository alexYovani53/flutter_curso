import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/cast_models/cast.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<MovieProvider>(context, listen: false).getCast(movieId),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Container();
          }
          final data = snapshot.data as List<Cast>;
          return Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) => _CastCard(cast: data[index]),
              ));
        }
        return Container(
          child: const CupertinoActivityIndicator(),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;
  const _CastCard({Key? key, required this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("assets/loading.gif"),
                image: NetworkImage(cast.fullImage),
                height: 140,
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 5),
          Text(
            cast.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
