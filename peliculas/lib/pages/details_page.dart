import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/util/app_color.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  static const routeName = 'details';
  late Movie movie;
  @override
  Widget build(BuildContext context) {
    movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBarr(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(movie),
                if (movie.overview != null)
                  ...movie.overview!
                      .split(". ")
                      .map((e) => _Overview(text: e))
                      .toList(),
                CastingCards(movieId: movie.id),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarr extends StatelessWidget {
  final Movie movie;
  const _CustomAppBarr({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.shared.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text('${movie.title}'),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage("assets/loading.gif"),
          imageErrorBuilder: (context, error, stackTrace) => Image.asset("assets/no-image.jpg", fit: BoxFit.cover,),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
          height: 150,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FadeInImage(
                placeholder: const AssetImage("assets/loading.gif"),
                image: NetworkImage(movie.fullImage),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${movie.title}',
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text('${movie.originalTitle}',
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    const Icon(Icons.star_outlined,
                        size: 15, color: Colors.green),
                    Text('${movie.voteAverage}', style: textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String text;

  const _Overview({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
